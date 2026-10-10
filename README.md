# PAMR — Pakistan Airport Management Record
## Full Stack: Node.js Backend + HTML Frontend

---

## PROJECT STRUCTURE

```
pamr/
├── backend/
│   ├── server.js        ← Express API server
│   └── package.json     ← Dependencies
└── frontend/
    └── index.html       ← Full frontend app
```

---

## SETUP INSTRUCTIONS

### STEP 1 — Install Node.js Dependencies

```bash
cd backend
npm install
```

### STEP 2 — Configure MySQL

Open `backend/server.js` and edit the DB_CONFIG block:

```js
const DB_CONFIG = {
  host:     'localhost',
  port:     3306,
  user:     'root',
  password: 'YOUR_MYSQL_PASSWORD',   // ← edit this
  database: 'PAMR',
};
```

Make sure your MySQL server is running and the PAMR database exists.

### STEP 3 — Run the Backend

```bash
cd backend
node server.js
```

You should see:
```
✅  MySQL connected — PAMR @ localhost
╔══════════════════════════════════════╗
║   PAMR API Server — Running          ║
║   http://localhost:3000              ║
╚══════════════════════════════════════╝
```

### STEP 4 — Open the Frontend

Option A — Open directly in browser:
  Just double-click `frontend/index.html`

Option B — Served by the backend (recommended):
  Go to http://localhost:3000 in your browser
  The backend already serves the frontend folder as static files.

---

## API ENDPOINTS

| Method | Endpoint                    | Description                        |
|--------|-----------------------------|------------------------------------|
| GET    | /api/health                 | Server + DB health check           |
| GET    | /api/airports               | All airports                       |
| GET    | /api/departures?airport=LHE | Departures for an airport          |
| GET    | /api/arrivals?airport=LHE   | Arrivals for an airport            |
| GET    | /api/stats?airport=LHE      | Flight count statistics            |
| GET    | /api/flights/:cs            | Single flight by callsign          |
| GET    | /api/airlines               | All distinct airlines              |
| POST   | /api/departures             | Add new departure                  |
| POST   | /api/arrivals               | Add new arrival                    |
| PUT    | /api/departures/:cs         | Update departure                   |
| PUT    | /api/arrivals/:cs           | Update arrival                     |
| PUT    | /api/departures/:cs/status  | Update departure status only       |
| PUT    | /api/arrivals/:cs/status    | Update arrival status only         |
| DELETE | /api/departures/:cs         | Delete departure                   |
| DELETE | /api/arrivals/:cs           | Delete arrival                     |

---

## QUERY PARAMETERS

### GET /api/departures or /api/arrivals

| Param    | Example          | Description                    |
|----------|------------------|--------------------------------|
| airport  | ?airport=LHE     | Filter by origin/dest airport  |
| status   | ?status=Delayed  | Filter by flight status        |
| airline  | ?airline=Emirates| Filter by airline name         |
| search   | ?search=EK623    | Search by callsign/dest/airline|

---

## FRONTEND FEATURES

- Airport Selector popup (all 14 PAMR airports)
- Live FIDS board — departures & arrivals with auto-refresh every 30s
- Live clock (PKT)
- DB connection status indicator (LIVE / DEMO / OFFLINE)
- Flight Search portal — filter by callsign, airline, destination, status, type
- Admin Panel:
  - Statistics bar (total dep, arr, delayed, cancelled, on-time)
  - Add new flight form (departure or arrival)
  - Inline editable departure/arrival lists with save + delete
  - Filter chips by status

---

## STATUS CODES

| Status    | Trigger                              |
|-----------|--------------------------------------|
| Scheduled | > 30 min before flight time          |
| Boarding  | Within 30 min of departure time      |
| Departed  | Past departure time                  |
| Arriving  | Within 30 min of arrival time        |
| Landed    | Past arrival time                    |
| Delayed   | Manual override — never auto-updated |
| Cancelled | Manual override — never auto-updated |
| Estimated | Manual override — never auto-updated |
