// PAMR - Pakistan Airport Management Record
// Backend API Server | Node.js + Express + MySQL2

const express = require('express');
const mysql = require('mysql2/promise');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// CORS - allow frontend origin
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  if (req.method === 'OPTIONS') return res.sendStatus(200);
  next();
});

// Serve frontend static files
app.use(express.static(path.join(__dirname)));

// Edit these to match your MySQL credentials. You can also set them via environment
// variables (for example in a .env file) for better security.
const DB_CONFIG = {
  host: process.env.DB_HOST || '127.0.0.1',
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASS || '0925',
  database: process.env.DB_NAME || 'PAMR',
  waitForConnections: true,
  connectionLimit: 10,
  timezone: '+05:00', // PKT
};

let pool;

async function connectDB() {
  try {
    pool = mysql.createPool(DB_CONFIG);
    const conn = await pool.getConnection();
    console.log('MySQL connected -', DB_CONFIG.database, '@', DB_CONFIG.host);
    conn.release();
  } catch (err) {
    console.error('MySQL connection failed:', err.message);
    console.warn('Running in DEMO mode - live DB queries will return mock data');
    pool = null;
  }
}

// Live status helper (mirrors SQL CASE logic)
function calcDepStatus(stat, timesStr) {
  const fixed = ['Cancelled', 'Delayed', 'Estimated'];
  if (fixed.includes(stat)) return stat;

  const now = new Date();
  const [h, m, s] = String(timesStr || '00:00:00').split(':').map(Number);
  const ft = new Date(now);
  ft.setHours(h, m, s, 0);

  const diff = (ft - now) / 60000;
  if (diff <= 0) return 'Departed';
  if (diff <= 30) return 'Boarding';
  return 'Scheduled';
}

function calcArrStatus(stat, timesStr) {
  const fixed = ['Cancelled', 'Delayed', 'Estimated'];
  if (fixed.includes(stat)) return stat;

  const now = new Date();
  const [h, m, s] = String(timesStr || '00:00:00').split(':').map(Number);
  const ft = new Date(now);
  ft.setHours(h, m, s, 0);

  const diff = (ft - now) / 60000;
  if (diff <= 0) return 'Landed';
  if (diff <= 30) return 'Arriving';
  return 'Scheduled';
}

// Query wrapper
async function query(sql, params = []) {
  if (!pool) throw new Error('No database connection');
  const [rows] = await pool.execute(sql, params);
  return rows;
}

// GET /api/health
app.get('/api/health', async (req, res) => {
  const dbOk = pool !== null;
  res.json({
    status: 'ok',
    db: dbOk ? 'connected' : 'disconnected',
    server: 'PAMR API v1.0',
    time: new Date().toISOString(),
  });
});

// GET /api/airports
app.get('/api/airports', async (req, res) => {
  try {
    const rows = await query('SELECT * FROM airports ORDER BY airport_name ASC');
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// GET /api/departures?airport=LHE&status=Delayed
app.get('/api/departures', async (req, res) => {
  try {
    const { airport, status, airline, search } = req.query;
    let sql = 'SELECT * FROM departures WHERE 1=1';
    const params = [];

    if (airport) {
      sql += ' AND dc = ?';
      params.push(airport);
    }
    if (status) {
      sql += ' AND stat = ?';
      params.push(status);
    }
    if (airline) {
      sql += ' AND airl LIKE ?';
      params.push(`%${airline}%`);
    }
    if (search) {
      sql += ' AND (cs LIKE ? OR d_name LIKE ? OR airl LIKE ?)';
      params.push(`%${search}%`, `%${search}%`, `%${search}%`);
    }

    sql += ' ORDER BY times ASC';

    const rows = await query(sql, params);
    const data = rows.map(r => ({ ...r, live_status: calcDepStatus(r.stat, r.times) }));
    res.json({ success: true, count: data.length, data });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// GET /api/arrivals?airport=LHE
app.get('/api/arrivals', async (req, res) => {
  try {
    const { airport, status, airline, search } = req.query;
    let sql = 'SELECT * FROM arrival WHERE 1=1';
    const params = [];

    if (airport) {
      sql += ' AND ac = ?';
      params.push(airport);
    }
    if (status) {
      sql += ' AND stat = ?';
      params.push(status);
    }
    if (airline) {
      sql += ' AND airl LIKE ?';
      params.push(`%${airline}%`);
    }
    if (search) {
      sql += ' AND (cs LIKE ? OR a_name LIKE ? OR airl LIKE ?)';
      params.push(`%${search}%`, `%${search}%`, `%${search}%`);
    }

    sql += ' ORDER BY times ASC';

    const rows = await query(sql, params);
    const data = rows.map(r => ({ ...r, live_status: calcArrStatus(r.stat, r.times) }));
    res.json({ success: true, count: data.length, data });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// GET /api/flights/:cs
app.get('/api/flights/:cs', async (req, res) => {
  try {
    const { cs } = req.params;
    const deps = await query('SELECT *, "DEP" AS type FROM departures WHERE cs = ?', [cs]);
    const arrs = await query('SELECT *, "ARR" AS type FROM arrival WHERE cs = ?', [cs]);
    const all = [...deps, ...arrs];

    if (!all.length) {
      return res.status(404).json({ success: false, error: 'Flight not found' });
    }

    res.json({ success: true, data: all[0] });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// GET /api/stats?airport=LHE
app.get('/api/stats', async (req, res) => {
  try {
    const { airport } = req.query;
    const apFilter = airport ? ' WHERE dc = ?' : '';
    const apFilter2 = airport ? ' WHERE ac = ?' : '';
    const p = airport ? [airport] : [];

    const [totalDep] = await query(`SELECT COUNT(*) AS n FROM departures${apFilter}`, p);
    const [totalArr] = await query(`SELECT COUNT(*) AS n FROM arrival${apFilter2}`, p);
    const [delayed] = await query(
      `SELECT COUNT(*) AS n FROM (SELECT cs FROM departures WHERE stat='Delayed'${airport ? ' AND dc=?' : ''} UNION ALL SELECT cs FROM arrival WHERE stat='Delayed'${airport ? ' AND ac=?' : ''}) t`,
      airport ? [airport, airport] : []
    );
    const [cancelled] = await query(
      `SELECT COUNT(*) AS n FROM (SELECT cs FROM departures WHERE stat='Cancelled'${airport ? ' AND dc=?' : ''} UNION ALL SELECT cs FROM arrival WHERE stat='Cancelled'${airport ? ' AND ac=?' : ''}) t`,
      airport ? [airport, airport] : []
    );
    const [ontime] = await query(
      `SELECT COUNT(*) AS n FROM (SELECT cs FROM departures WHERE stat='Departed'${airport ? ' AND dc=?' : ''} UNION ALL SELECT cs FROM arrival WHERE stat='Landed'${airport ? ' AND ac=?' : ''}) t`,
      airport ? [airport, airport] : []
    );

    res.json({
      success: true,
      data: {
        departures: totalDep.n,
        arrivals: totalArr.n,
        delayed: delayed.n,
        cancelled: cancelled.n,
        ontime: ontime.n,
      },
    });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// GET /api/airlines
app.get('/api/airlines', async (req, res) => {
  try {
    const rows = await query(
      `SELECT DISTINCT airl FROM departures
       UNION
       SELECT DISTINCT airl FROM arrival
       ORDER BY airl ASC`
    );
    res.json({ success: true, data: rows.map(r => r.airl) });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// POST /api/departures
app.post('/api/departures', async (req, res) => {
  try {
    const { cs, airl, cc, dc, d_name, times, stat } = req.body;
    if (!cs || !airl || !cc || !dc || !d_name || !times) {
      return res.status(400).json({ success: false, error: 'Missing required fields' });
    }

    await query(
      'INSERT INTO departures (cs, airl, cc, dc, d_name, times, stat) VALUES (?,?,?,?,?,?,?)',
      [cs, airl, cc, dc, d_name, times, stat || 'Scheduled']
    );
    res.status(201).json({ success: true, message: `Flight ${cs} added to departures` });
  } catch (err) {
    if (err.code === 'ER_DUP_ENTRY') {
      return res.status(409).json({ success: false, error: 'Callsign already exists' });
    }
    res.status(500).json({ success: false, error: err.message });
  }
});

// POST /api/arrivals
app.post('/api/arrivals', async (req, res) => {
  try {
    const { cs, airl, ac, cc, a_name, times, stat } = req.body;
    if (!cs || !airl || !ac || !cc || !a_name || !times) {
      return res.status(400).json({ success: false, error: 'Missing required fields' });
    }

    await query(
      'INSERT INTO arrival (cs, airl, ac, cc, a_name, times, stat) VALUES (?,?,?,?,?,?,?)',
      [cs, airl, ac, cc, a_name, times, stat || 'Scheduled']
    );
    res.status(201).json({ success: true, message: `Flight ${cs} added to arrivals` });
  } catch (err) {
    if (err.code === 'ER_DUP_ENTRY') {
      return res.status(409).json({ success: false, error: 'Callsign already exists' });
    }
    res.status(500).json({ success: false, error: err.message });
  }
});

// PUT /api/departures/:cs
app.put('/api/departures/:cs', async (req, res) => {
  try {
    const { cs } = req.params;
    const { airl, cc, d_name, times, stat } = req.body;
    await query(
      'UPDATE departures SET airl=?, cc=?, d_name=?, times=?, stat=? WHERE cs=?',
      [airl, cc, d_name, times, stat, cs]
    );
    res.json({ success: true, message: `Departure ${cs} updated` });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// PUT /api/arrivals/:cs
app.put('/api/arrivals/:cs', async (req, res) => {
  try {
    const { cs } = req.params;
    const { airl, ac, a_name, times, stat } = req.body;
    await query(
      'UPDATE arrival SET airl=?, ac=?, a_name=?, times=?, stat=? WHERE cs=?',
      [airl, ac, a_name, times, stat, cs]
    );
    res.json({ success: true, message: `Arrival ${cs} updated` });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// DELETE /api/departures/:cs
app.delete('/api/departures/:cs', async (req, res) => {
  try {
    const { cs } = req.params;
    await query('DELETE FROM departures WHERE cs = ?', [cs]);
    res.json({ success: true, message: `Departure ${cs} deleted` });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// DELETE /api/arrivals/:cs
app.delete('/api/arrivals/:cs', async (req, res) => {
  try {
    const { cs } = req.params;
    await query('DELETE FROM arrival WHERE cs = ?', [cs]);
    res.json({ success: true, message: `Arrival ${cs} deleted` });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// PUT /api/departures/:cs/status
app.put('/api/departures/:cs/status', async (req, res) => {
  try {
    const { cs } = req.params;
    const { stat } = req.body;
    const allowed = ['Scheduled', 'Departed', 'Boarding', 'Delayed', 'Cancelled', 'Estimated'];
    if (!allowed.includes(stat)) {
      return res.status(400).json({ success: false, error: 'Invalid status value' });
    }
    await query('UPDATE departures SET stat=? WHERE cs=?', [stat, cs]);
    res.json({ success: true, message: `Status of ${cs} updated to ${stat}` });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// PUT /api/arrivals/:cs/status
app.put('/api/arrivals/:cs/status', async (req, res) => {
  try {
    const { cs } = req.params;
    const { stat } = req.body;
    const allowed = ['Scheduled', 'Landed', 'Arriving', 'Delayed', 'Cancelled', 'Estimated'];
    if (!allowed.includes(stat)) {
      return res.status(400).json({ success: false, error: 'Invalid status value' });
    }
    await query('UPDATE arrival SET stat=? WHERE cs=?', [stat, cs]);
    res.json({ success: true, message: `Status of ${cs} updated to ${stat}` });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// Fallback - serve frontend index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Start server
connectDB().then(() => {
  app.listen(PORT, () => {
    console.log('');
    console.log('╔══════════════════════════════════════╗');
    console.log('║   PAMR API Server - Running          ║');
    console.log(`║   http://localhost:${PORT}           ║`);
    console.log('║   Pakistan  Airspace  Record         ║');
    console.log('╚══════════════════════════════════════╝');
    console.log('');
    console.log('Endpoints:');
    console.log('  GET  /api/airports');
    console.log('  GET  /api/departures?airport=LHE');
    console.log('  GET  /api/arrivals?airport=LHE');
    console.log('  GET  /api/stats?airport=LHE');
    console.log('  GET  /api/flights/:cs');
    console.log('  POST /api/departures');
    console.log('  POST /api/arrivals');
    console.log('  PUT  /api/departures/:cs');
    console.log('  PUT  /api/arrivals/:cs');
    console.log('  DEL  /api/departures/:cs');
    console.log('  DEL  /api/arrivals/:cs');
    console.log('');
  });
});
