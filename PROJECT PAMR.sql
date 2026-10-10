create database PAMR;
use PAMR;

create table airports (
a_code varchar(5) primary key, #FIR Airport Codes
cc varchar (5) unique, #city code
airport_name varchar(100),
city_name varchar(50),
airport_type varchar(50));

select * from airports;

drop table departures ,arrival;

insert into airports values 
('OPLA','LHE','Allama Iqbal International Airport','Lahore','International'),
('OPKC','KHI','Jinnah International Airport','Karachi','International'),
('OPIS','ISB','Islamabad International Airport','Islamabad','International'),
('OPPS','PEW','Peshawar Bacha Khan International Airport','Peshawar','International'),
('OPQT','UET','Quetta International Airport','Quetta','International'),
('OPMT','MUX','Multan International Airport','Multan','International'),
('OPFA','LYP','Faislabad International Airport','Faisalabad','International'),
('OPST','SKT','Sialkot International Airport','Sialkot','International'),
('OPGD','GWD','Gwadar International Airport','Gwadar','International'),
('OPGT','GIL','Gilgit Airport','Gilgit','Domestic'),
('OPBW','BHV','Bahawalpur Airport','Bhawalpur','Domestic'),
('OPRK','RYK','Rahim Yar Khan Sheikh Zayed International Airport','Rahim Yar Khan','International'),
('OPSK','SKZ','Sukkur Airport','Sukkur','Domestic'),
('OPSD','KDU','Skardu Airport','Skardu','Domestic');


create table departures (
cs varchar(6) primary key, -- Callsign
airl varchar(50) not null, -- Airline
cc varchar (5) , -- City Code
dc varchar (5), -- Destination Code
d_name varchar (100), -- Destination Name
times time,  -- Time Of Departure
stat varchar(50)); -- Status



create table arrival (
cs varchar(6) primary key, -- callsign
airl varchar(50) not null, -- Airline
ac varchar (5) , -- airport code(arrival)
cc varchar (5), -- FROM AIRPORT
a_name varchar (100), -- Aiport Name Name
times  time , -- Time of Arrival
stat varchar(50));

-- Departure Data:
insert into departures values
('PA430', 'Airblue', 'AUH', 'LHE', 'Abu Dhabi', '00:50:00', 'Cancelled'),
('PA410', 'Airblue', 'DXB', 'LHE', 'Dubai', '02:15:00', 'departed'),
('SV739', 'Saudi Airlines', 'JED', 'LHE', 'Jeddah', '02:40:00', 'departed'),
('J9502', 'Jazeera Airways', 'KWI', 'LHE', 'Kuwait City', '02:50:00', 'departed'),
('XY884', 'FlyNas', 'DMM', 'LHE', 'Dammam', '03:15:00', 'Scheduled'),
('EK623', 'Emirates', 'DXB', 'LHE', 'Dubai', '03:25:00', 'Delayed'),
('QR621', 'Qatar Airways', 'DOH', 'LHE', 'Doha', '03:30:00', 'Delayed'),
('XY318', 'FlyNas', 'RUH', 'LHE', 'Riyadh', '03:55:00', 'Scheduled'),
('9P507', 'FlyJinnah', 'SHJ', 'LHE', 'Sharjah', '04:20:00', 'Scheduled'),
('EY285', 'Etihad Airways', 'AUH', 'LHE', 'Abu Dhabi', '04:40:00', 'Scheduled'),
('TK715', 'Turkish Airways', 'IST', 'LHE', 'Istanbul', '05:35:00', 'Scheduled'),
('PA470', 'Airblue', 'JED', 'LHE', 'Jeddah', '05:45:00', 'Scheduled'),
('UL154', 'Srilankan Airways', 'CMB', 'LHE', 'Colombo', '06:59:00', 'Scheduled'),
('GF765', 'Gulf Airways', 'BAH', 'LHE', 'Bahrain', '07:00:00', 'Scheduled'),
('F3656', 'Flyadeal', 'RUH', 'LHE', 'Riyadh', '07:40:00', 'Scheduled'),
('9P842', 'FlyJinnah', 'KHI', 'LHE', 'Karachi', '08:00:00', 'Scheduled'),
('9P735', 'FlyJinnah', 'ISB', 'LHE', 'Islamabad', '08:35:00', 'Scheduled'),
('PK247', 'Pakistan International Airline', 'DMM', 'LHE', 'Dammam', '08:45:00', 'Scheduled'),
('7L5688', 'SilkWay West Airlines', 'GYD', 'LHE', 'Baku', '09:00:00', 'Scheduled'),
('9P580', 'FlyJinnah', 'RUH', 'LHE', 'Riyadh', '09:10:00', 'Scheduled'),
('EK625', 'Emirates', 'DXB', 'LHE', 'Dubai', '09:35:00', 'Scheduled'),
('TK745', 'Turkish Airways', 'IST', 'LHE', 'Istanbul', '09:55:00', 'Scheduled'),
('QR629', 'Qatar Airways', 'DOH', 'LHE', 'Doha', '10:00:00', 'Scheduled'),
('PA704', 'Airblue', 'KDU', 'LHE', 'Skardu', '10:15:00', 'Scheduled'),
('9P849', 'AirArabia', 'KHI', 'LHE', 'Karachi', '11:00:00', 'Scheduled'),
('PK303', 'Pakistan International Airline', 'KHI', 'LHE', 'Karachi', '12:05:00', 'Scheduled'),
('9P509', 'FlyJinnah', 'SHJ', 'LHE', 'Sharjah', '12:20:00', 'Scheduled'),
('PK757', 'Pakistan International Airline', 'LHR', 'LHE', 'London', '12:30:00', 'Scheduled'),
('PF742', 'AirSial', 'DMM', 'LHE', 'Dammam', '14:25:00', 'Scheduled'),
('9P841', 'AirArabia', 'KHI', 'LHE', 'Karachi', '15:00:00', 'Scheduled'),
('5K721', 'HiFly', 'DXB', 'LHE', 'Dubai', '16:00:00', 'Scheduled'),
('KA582', 'Aero Nomad', 'FRU', 'LHE', 'Bishkek', '17:00:00', 'Scheduled'),
('9P514', 'FlyJinnah', 'DXB', 'LHE', 'Dubai', '17:00:00', 'Scheduled'),
('PA405', 'Airblue', 'KHI', 'LHE', 'Karachi', '18:05:00', 'Scheduled'),
('PK305', 'Pakistan International Airline', 'KHI', 'LHE', 'Karachi', '18:20:00', 'Scheduled'),
('SV733', 'Saudi Airlines', 'JED', 'LHE', 'Jeddah', '18:25:00', 'Scheduled'),
('9P847', 'FlyJinnah', 'KHI', 'LHE', 'Karachi', '19:45:00', 'Scheduled'),
('9P751', 'FlyJinnah', 'ISB', 'LHE', 'Islamabad', '20:05:00', 'Scheduled'),
('EY289', 'Etihad Airways', 'AUH', 'LHE', 'Abu Dhabi', '20:20:00', 'Scheduled'),
('9P500', 'FlyJinnah', 'SHJ', 'LHE', 'Sharjah', '20:35:00', 'Scheduled'),
('9P502', 'FlyJinnah', 'SHJ', 'LHE', 'Sharjah', '21:35:00', 'Scheduled'),
('9P586', 'FlyJinnah', 'JED', 'LHE', 'Jeddah', '21:45:00', 'Scheduled'),
('PF146', 'AirSial', 'KHI', 'LHE', 'Karachi', '22:05:00', 'Scheduled'),
('OD132', 'Malindo Air', 'KUL', 'LHE', 'Kuala Lumpur', '22:10:00', 'Scheduled'),
('CZ6038', 'China Southern Airways', 'CAN', 'LHE', 'Guangzhou', '22:10:00', 'Scheduled'),
('PA474', 'Airblue', 'RUH', 'LHE', 'Riyadh', '23:10:00', 'Scheduled'),
('PF716', 'AirSial', 'JED', 'LHE', 'Jeddah', '00:10:00', 'Scheduled'),
('YG9090', 'YTO Cargo Airlines', 'KMG', 'LHE', 'Kunming', '01:10:00', 'Scheduled'),
('PF766', 'AirSial', 'RUH', 'LHE', 'Riyadh', '02:10:00', 'Scheduled'),
('YG9182', 'YTO Cargo Airlines', 'URC', 'LHE', 'Urumqi', '03:10:00', 'Scheduled'),
('PA472', 'Airblue', 'JED', 'LHE', 'Jeddah', '04:10:00', 'Scheduled'),
('TG346', 'Thai Airways', 'BKK', 'LHE', 'Bangkok', '05:10:00', 'Scheduled');
insert into departures values 
('9P672', 'FlyJinnah', 'ISB', 'ISB', 'Islamabad', '14:40:00', 'Departed'),
('5K711', 'HiFly', 'DWC', 'ISB', 'Dubai', '14:45:00', 'Scheduled'),
('PA200', 'Airblue', 'ISB', 'ISB', 'Islamabad', '15:00:00', 'Estimated'),
('9P870', 'FlyJinnah', 'MUX', 'ISB', 'Multan', '15:30:00', 'Departed'),
('9P8012', 'FlyJinnah', 'LHE', 'ISB', 'Lahore', '15:35:00', 'Departed'),
('PK308', 'Pakistan International Airline', 'ISB', 'ISB', 'Islamabad', '16:00:00', 'Departed'),
('FZ336', 'FlyDubai', 'DXB', 'ISB', 'Dubai', '16:40:00', 'Departed'),
('PK390', 'Pakistan International Airline', 'SKZ', 'ISB', 'Sukkur', '17:05:00', 'Departed'),
('G9547', 'Air Arabia', 'SHJ', 'ISB', 'Sharjah', '17:25:00', 'Departed'),
('PA110', 'Airblue', 'DXB', 'ISB', 'Dubai', '17:35:00', 'Departed'),
('ET695', 'Ethiopian Airlines', 'ADD', 'ISB', 'Addis Ababa', '17:40:00', 'Departed'),
('PK963', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '17:45:00', 'Departed'),
('PF145', 'AirSial', 'LHE', 'ISB', 'Lahore', '18:00:00', 'Departed'),
('PF125', 'AirSial', 'ISB', 'ISB', 'Islamabad', '18:20:00', 'Departed'),
('PK536', 'Pakistan International Airline', 'SKZ', 'ISB', 'Sukkur', '18:30:00', 'Departed'),
('9P674', 'FlyJinnah', 'ISB', 'ISB', 'Islamabad', '18:35:00', 'Departed'),
('G9543', 'Air Arabia', 'SHJ', 'ISB', 'Sharjah', '19:00:00', 'Departed'),
('PA406', 'Airblue', 'LHE', 'ISB', 'Lahore', '20:00:00', 'Scheduled'),
('PA208', 'Airblue', 'ISB', 'ISB', 'Islamabad', '20:00:00', 'Departed'),
('PK861', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '20:05:00', 'Departed'),
('9P600', 'FlyJinnah', 'JED', 'ISB', 'Jeddah', '20:15:00', 'Departed'),
('PK961', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '20:45:00', 'Departed'),
('9P846', 'FlyJinnah', 'LHE', 'ISB', 'Lahore', '20:50:00', 'Departed'),
('9P678', 'FlyJinnah', 'ISB', 'ISB', 'Islamabad', '21:00:00', 'Departed'),
('YG9068', 'YTO Cargo Airlines', 'KMG', 'ISB', 'Kunming', '21:10:00', 'Scheduled'),
('PK370', 'Pakistan International Airline', 'ISB', 'ISB', 'Islamabad', '21:30:00', 'Departed'),
('EY295', 'Etihad Airways', 'AUH', 'ISB', 'Abu Dhabi', '21:35:00', 'Departed'),
('PK761', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '21:55:00', 'Departed'),
('EK603', 'Emirates', 'DXB', 'ISB', 'Dubai', '22:55:00', 'Departed'),
('PK739', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '23:35:00', 'Departed'),
('FZ330', 'FlyDubai', 'DXB', 'ISB', 'Dubai', '23:55:00', 'Departed'),
('PF714', 'AirSial', 'JED', 'ISB', 'Jeddah', '02:05:00', 'Scheduled'),
('PK763', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '03:20:00', 'Estimated'),
('QR605', 'Qatar Airways', 'DOH', 'ISB', 'Doha', '03:20:00', 'Scheduled'),
('PA172', 'Airblue', 'JED', 'ISB', 'Jeddah', '03:30:00', 'Scheduled'),
('PC131', 'Pegasus Airlines', 'SAW', 'ISB', 'Istanbul', '04:25:00', 'Estimated'),
('FZ332', 'FlyDubai', 'DXB', 'ISB', 'Dubai', '04:55:00', 'Cancelled'),
('EY297', 'Etihad Airways', 'AUH', 'ISB', 'Abu Dhabi', '05:25:00', 'Estimated'),
('TK709', 'Turkish Airways', 'IST', 'ISB', 'Istanbul', '05:50:00', 'Estimated'),
('9P670', 'FlyJinnah', 'ISB', 'ISB', 'Islamabad', '07:00:00', 'Scheduled'),
('OV514', 'Oman Air', 'MCT', 'ISB', 'Muscat', '07:00:00', 'Scheduled'),
('PF121', 'AirSial', 'ISB', 'ISB', 'Islamabad', '07:00:00', 'Scheduled'),
('PK300', 'Pakistan International Airline', 'ISB', 'ISB', 'Islamabad', '07:00:00', 'Estimated'),
('9P851', 'FlyJinnah', 'UET', 'ISB', 'Quetta', '07:25:00', 'Scheduled'),
('PK939', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '07:45:00', 'Estimated'),
('F3662', 'Flyadeal', 'RUH', 'ISB', 'Riyadh', '08:00:00', 'Scheduled'),
('F3830', 'Flyadeal', 'JED', 'ISB', 'Jeddah', '08:00:00', 'Scheduled'),
('PK302', 'Pakistan International Airline', 'LHE', 'ISB', 'Lahore', '08:00:00', 'Estimated'),
('9P848', 'FlyJinnah', 'LHE', 'ISB', 'Lahore', '08:15:00', 'Scheduled'),
('PK729', 'Pakistan International Airline', 'RUH', 'ISB', 'Riyadh', '08:20:00', 'Estimated'),
('9P820', 'FlyJinnah', 'SKT', 'ISB', 'Sialkot', '09:35:00', 'Scheduled'),
('QR611', 'Qatar Airways', 'DOH', 'ISB', 'Doha', '10:15:00', 'Scheduled'),
('9P840', 'FlyJinnah', 'LHE', 'ISB', 'Lahore', '10:30:00', 'Scheduled'),
('QR868', 'Qatar Airways', 'DOH', 'ISB', 'Doha', '10:40:00', 'Scheduled'),
('G9543B', 'Air Arabia', 'SHJ', 'ISB', 'Sharjah', '10:45:00', 'Estimated'),
('WY324', 'Oman Air', 'MCT', 'ISB', 'Muscat', '11:35:00', 'Estimated'),
('FZ334', 'FlyDubai', 'DXB', 'ISB', 'Dubai', '11:40:00', 'Estimated'),
('PK845', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '12:00:00', 'Estimated'),
('EK601', 'Emirates', 'DXB', 'ISB', 'Dubai', '12:15:00', 'Estimated'),
('PA200B', 'Airblue', 'ISB', 'ISB', 'Islamabad', '12:15:00', 'Scheduled'),
('PF143', 'AirSial', 'LHE', 'ISB', 'Lahore', '12:15:00', 'Scheduled'),
('PF123', 'AirSial', 'ISB', 'ISB', 'Islamabad', '12:40:00', 'Scheduled'),
('QR868B', 'Qatar Airways', 'DOH', 'ISB', 'Doha', '12:50:00', 'Scheduled'),
('PK745', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '13:15:00', 'Cancelled'),
('9P865', 'FlyJinnah', 'PEW', 'ISB', 'Peshawar', '13:20:00', 'Scheduled'),
('PA402', 'Airblue', 'LHE', 'ISB', 'Lahore', '13:30:00', 'Scheduled'),
('PK304', 'Pakistan International Airline', 'LHE', 'ISB', 'Lahore', '14:00:00', 'Estimated'),
('PK503', 'Pakistan International Airline', 'GWD', 'ISB', 'Gwadar', '14:00:00', 'Estimated'),
('PA216', 'Airblue', 'DXB', 'KHI', 'Dubai', '14:45:00', 'Departed'),
('PF124', 'AirSial', 'KHI', 'KHI', 'Karachi', '15:30:00', 'Departed'),
('9P782', 'FlyJinnah', 'RUH', 'KHI', 'Riyadh', '16:30:00', 'Departed'),
('PA207', 'Airblue', 'KHI', 'KHI', 'Karachi', '16:45:00', 'Departed'),
('9P673', 'FlyJinnah', 'KHI', 'KHI', 'Karachi', '17:15:00', 'Departed'),
('9P750', 'FlyJinnah', 'LHE', 'KHI', 'Lahore', '18:00:00', 'Departed'),
('9P740', 'FlyJinnah', 'SHJ', 'KHI', 'Sharjah', '18:05:00', 'Departed'),
('PK309', 'Pakistan International Airline', 'KHI', 'KHI', 'Karachi', '19:00:00', 'Departed'),
('9P710', 'FlyJinnah', 'DMM', 'KHI', 'Dammam', '19:30:00', 'Departed'),
('PF768', 'AirSial', 'RUH', 'KHI', 'Riyadh', '19:45:00', 'Departed'),
('EY301', 'Etihad Airways', 'AUH', 'KHI', 'Abu Dhabi', '19:45:00', 'Departed'),
('PA284', 'Airblue', 'RUH', 'KHI', 'Riyadh', '20:10:00', 'Departed'),
('PF126', 'AirSial', 'KHI', 'KHI', 'Karachi', '21:10:00', 'Departed'),
('9P742', 'FlyJinnah', 'SHJ', 'KHI', 'Sharjah', '21:10:00', 'Estimated'),
('9P675', 'FlyJinnah', 'KHI', 'KHI', 'Karachi', '21:20:00', 'Departed'),
('PK181', 'Pakistan International Airline', 'SHJ', 'KHI', 'Sharjah', '21:45:00', 'Departed'),
('PF718', 'AirSial', 'JED', 'KHI', 'Jeddah', '22:10:00', 'Scheduled'),
('TG350', 'Thai Airways', 'BKK', 'KHI', 'Bangkok', '23:20:00', 'Departed'),
('9P679', 'FlyJinnah', 'KHI', 'KHI', 'Karachi', '23:45:00', 'Departed'),
('PA272', 'Airblue', 'JED', 'KHI', 'Jeddah', '23:55:00', 'Departed'),
('BA2160', 'British Airways', 'LGW', 'KHI', 'London', '00:20:00', 'Departed'),
('J2144', 'Azerbaijan Airlines', 'GYD', 'KHI', 'Baku', '02:45:00', 'Estimated'),
('SV727', 'Saudi Airlines', 'JED', 'KHI', 'Jeddah', '03:00:00', 'Estimated'),
('EK615', 'Emirates', 'DXB', 'KHI', 'Dubai', '03:05:00', 'Estimated'),
('KU206', 'Kuwait Airways', 'KWI', 'KHI', 'Kuwait City', '03:25:00', 'Estimated'),
('OV564', 'Oman Air', 'MCT', 'KHI', 'Muscat', '03:30:00', 'Estimated'),
('QR633', 'Qatar Airways', 'DOH', 'KHI', 'Doha', '03:30:00', 'Scheduled'),
('XY316', 'FlyNas', 'RUH', 'KHI', 'Riyadh', '03:50:00', 'Estimated'),
('9P744', 'FlyJinnah', 'SHJ', 'KHI', 'Sharjah', '04:35:00', 'Estimated'),
('EY303', 'Etihad Airways', 'AUH', 'KHI', 'Abu Dhabi', '04:50:00', 'Estimated'),
('TK711', 'Turkish Airways', 'IST', 'KHI', 'Istanbul', '05:05:00', 'Estimated'),
('PF868', 'AirSial', 'RUH', 'KHI', 'Riyadh', '05:40:00', 'Estimated'),
('PK291', 'Pakistan International Airline', 'MCT', 'KHI', 'Muscat', '05:40:00', 'Estimated'),
('PK451', 'Pakistan International Airline', 'KDU', 'KHI', 'Skardu', '06:00:00', 'Estimated'),
('PK143', 'Pakistan International Airline', 'AAN', 'KHI', 'Al Ain', '06:25:00', 'Estimated'),
('9P700', 'FlyJinnah', 'JED', 'KHI', 'Jeddah', '06:40:00', 'Estimated'),
('PF746', 'AirSial', 'DMM', 'KHI', 'Dammam', '07:00:00', 'Estimated'),
('MB707', 'Mahan Air', 'IST', 'KHI', 'Istanbul', '08:10:00', 'Scheduled'),
('9P734', 'FlyJinnah', 'LHE', 'KHI', 'Lahore', '08:40:00', 'Estimated'),
('PA702', 'Airblue', 'KDU', 'KHI', 'Skardu', '08:45:00', 'Estimated'),
('PA201', 'Airblue', 'KHI', 'KHI', 'Karachi', '09:00:00', 'Scheduled'),
('TK751', 'Turkish Airways', 'IST', 'KHI', 'Istanbul', '09:15:00', 'Estimated'),
('EK613', 'Emirates', 'DXB', 'KHI', 'Dubai', '09:25:00', 'Estimated'),
('9P671', 'FlyJinnah', 'KHI', 'KHI', 'Karachi', '09:35:00', 'Estimated'),
('PF122', 'AirSial', 'KHI', 'KHI', 'Karachi', '09:50:00', 'Estimated'),
('SV725', 'Saudi Airlines', 'RUH', 'KHI', 'Riyadh', '09:50:00', 'Estimated'),
('PK301', 'Pakistan International Airline', 'KHI', 'KHI', 'Karachi', '10:00:00', 'Estimated'),
('PK753', 'Pakistan International Airline', 'RUH', 'KHI', 'Riyadh', '10:00:00', 'Estimated'),
('9P858', 'FlyJinnah', 'UET', 'KHI', 'Quetta', '10:15:00', 'Estimated'),
('QR615', 'Qatar Airways', 'DOH', 'KHI', 'Doha', '10:40:00', 'Scheduled'),
('SV723', 'Saudi Airlines', 'JED', 'KHI', 'Jeddah', '10:50:00', 'Estimated'),
('W5118', 'Mahan Air', 'IKA', 'KHI', 'Tehran', '11:10:00', 'Scheduled'),
('PK701', 'Pakistan International Airline', 'MAN', 'KHI', 'Manchester', '12:30:00', 'Estimated'),
('PA270', 'Airblue', 'JED', 'KHI', 'Jeddah', '12:35:00', 'Scheduled'),
('PA278', 'Airblue', 'DMM', 'KHI', 'Dammam', '13:15:00', 'Scheduled');
INSERT INTO departures (cs, airl, cc, dc, d_name, times, stat) VALUES
('G9563', 'Air Arabia',                    'SHJ', 'FSD', 'Sharjah',     '01:45:00', 'Scheduled'),
('9P821', 'FlyJinnah',                    'KHI', 'SKT', 'Karachi',     '00:05:00', 'Scheduled'),
('G9553', 'Air Arabia',                   'SHJ', 'SKT', 'Sharjah',     '03:45:00', 'Scheduled'),
('FZ338', 'FlyDubai',                     'DXB', 'SKT', 'Dubai',       '05:50:00', 'Scheduled'),
('3L312', 'Air Arabia Abu Dhabi',          'AUH', 'SKT', 'Abu Dhabi',   '06:50:00', 'Scheduled'),
('PF736', 'AirSial',                      'MCT', 'SKT', 'Muscat',      '12:20:00', 'Scheduled'),
('PF720', 'AirSial',                      'JED', 'SKT', 'Jeddah',      '22:40:00', 'Scheduled'),
('QR601', 'Qatar Airways',                'DOH', 'PEW', 'Doha',        '03:55:00', 'Scheduled'),
('OV598', 'SalamAir',                     'MCT', 'PEW', 'Muscat',      '04:30:00', 'Scheduled'),
('EY277', 'Etihad Airways',               'AUH', 'PEW', 'Abu Dhabi',   '08:05:00', 'Scheduled'),
('SV797', 'Saudi Airlines',               'JED', 'PEW', 'Jeddah',      '11:25:00', 'Scheduled'),
('9P866', 'FlyJinnah',                    'KHI', 'PEW', 'Karachi',     '15:50:00', 'Scheduled'),

('PK835', 'Pakistan International Airline','JED', 'UET', 'Jeddah',      '03:10:00', 'Scheduled'),
('9P854', 'FlyJinnah',                    'KHI', 'UET', 'Karachi',     '09:25:00', 'Scheduled'),
('G9568', 'Air Arabia',                   'SHJ', 'UET', 'Sharjah',     '10:30:00', 'Scheduled'),
('FZ346', 'FlyDubai',                     'DXB', 'UET', 'Dubai',       '11:00:00', 'Scheduled'),
('9P857', 'FlyJinnah',                    'ISB', 'UET', 'Islamabad',   '12:25:00', 'Scheduled'),
('PF162', 'AirSial',                      'KHI', 'UET', 'Karachi',     '14:50:00', 'Scheduled'),
('PK504', 'Pakistan International Airline','KHI', 'GWD', 'Karachi',     '16:20:00', 'Scheduled'),
('PA876', 'Airblue',                      'MED', 'MUX', 'Medina',      '12:25:00', 'Scheduled'),
('G9559', 'Air Arabia',                   'SHJ', 'MUX', 'Sharjah',     '13:25:00', 'Scheduled'),
('3L336', 'Air Arabia Abu Dhabi',          'AUH', 'MUX', 'Abu Dhabi',   '14:25:00', 'Scheduled'),
('FZ326', 'FlyDubai',                     'DXB', 'MUX', 'Dubai',       '15:25:00', 'Scheduled'),
('PA810', 'Airblue',                      'DXB', 'MUX', 'Dubai',       '16:25:00', 'Scheduled'),
('PA812', 'Airblue',                      'SHJ', 'MUX', 'Sharjah',     '17:25:00', 'Scheduled'),
('9P871', 'FlyJinnah',                    'KHI', 'MUX', 'Karachi',     '18:25:00', 'Scheduled'),
('PA870', 'Airblue',                      'JED', 'MUX', 'Jeddah',      '19:25:00', 'Scheduled');

insert into arrival values
('TK714', 'Turkish Airways', 'IST', 'LHE', 'Istanbul', '04:05:00', 'Landed'),
('YG9089', 'YTO Cargo Airlines', 'KMG', 'LHE', 'Kunming', '04:30:00', 'Scheduled'),
('PA485', 'Airblue', 'RUH', 'LHE', 'Riyadh', '04:40:00', 'Landed'),
('PA411', 'Airblue', 'DXB', 'LHE', 'Dubai', '04:40:00', 'Landed'),
('GF764', 'Gulf Airways', 'BAH', 'LHE', 'Bahrain', '05:30:00', 'Landed'),
('UL153', 'Srilankan Airways', 'CMB', 'LHE', 'Colombo', '05:40:00', 'Landed'),
('F3655', 'Flyadeal', 'RUH', 'LHE', 'Riyadh', '06:40:00', 'Landed'),
('AZG568', 'SilkWay West Airlines', 'WTB', 'LHE', 'Toowoomba', '06:46:00', 'Scheduled'),
('PK758', 'Pakistan International Airline', 'LHR', 'LHE', 'London', '07:05:00', 'Landed'),
('EK624', 'Emirates', 'DXB', 'LHE', 'Dubai', '07:20:00', 'Landed'),
('QR628', 'Qatar Airways', 'DOH', 'LHE', 'Doha', '07:50:00', 'Landed'),
('9P734', 'FlyJinnah', 'ISB', 'LHE', 'Islamabad', '07:55:00', 'Landed'),
('PA413', 'Airblue', 'SHJ', 'LHE', 'Sharjah', '08:00:00', 'Scheduled'),
('TK744', 'Turkish Airways', 'IST', 'LHE', 'Istanbul', '08:05:00', 'Landed'),
('9P531', 'FlyJinnah', 'BAH', 'LHE', 'Bahrain', '08:05:00', 'Landed'),
('SV734', 'Saudi Airlines', 'JED', 'LHE', 'Jeddah', '08:50:00', 'Landed'),
('PK302', 'Pakistan International Airline', 'KHI', 'LHE', 'Karachi', '09:45:00', 'Landed'),
('9P848', 'FlyJinnah', 'KHI', 'LHE', 'Karachi', '10:00:00', 'Landed'),
('PF717', 'AirSial', 'JED', 'LHE', 'Jeddah', '10:20:00', 'Landed'),
('PK860', 'Pakistan International Airline', 'JED', 'LHE', 'Jeddah', '11:15:00', 'Landed'),
('PA473', 'Airblue', 'JED', 'LHE', 'Jeddah', '12:00:00', 'Scheduled'),
('9P840', 'FlyJinnah', 'KHI', 'LHE', 'Karachi', '12:15:00', 'Landed'),
('PA705', 'Airblue', 'KDU', 'LHE', 'Skardu', '14:20:00', 'Scheduled'),
('KA581', 'Aero Nomad', 'BSZ', 'LHE', 'Bishkek', '15:00:00', 'Landed'),
('PA402', 'Airblue', 'KHI', 'LHE', 'Karachi', '15:25:00', 'Landed'),
('PK304', 'Pakistan International Airline', 'KHI', 'LHE', 'Karachi', '15:45:00', 'Landed'),
('SV732', 'Saudi Airlines', 'JED', 'LHE', 'Jeddah', '16:25:00', 'Estimated'),
('9P842', 'FlyJinnah', 'KHI', 'LHE', 'Karachi', '17:20:00', 'Estimated'),
('9P750', 'FlyJinnah', 'ISB', 'LHE', 'Islamabad', '17:45:00', 'Scheduled'),
('PK248', 'Pakistan International Airline', 'DMM', 'LHE', 'Dammam', '17:50:00', 'Delayed'),
('PA471', 'Airblue', 'JED', 'LHE', 'Jeddah', '18:10:00', 'Estimated'),
('9P581', 'FlyJinnah', 'RUH', 'LHE', 'Riyadh', '18:20:00', 'Estimated'),
('EY288', 'Etihad Airways', 'AUH', 'LHE', 'Abu Dhabi', '18:25:00', 'Delayed'),
('9P501', 'FlyJinnah', 'SHJ', 'LHE', 'Sharjah', '19:20:00', 'Scheduled'),
('SV736', 'Saudi Airlines', 'RUH', 'LHE', 'Riyadh', '19:30:00', 'Estimated'),
('PF145', 'AirSial', 'KHI', 'LHE', 'Karachi', '19:45:00', 'Scheduled'),
('CZ6037', 'China Southern Airways', 'CAN', 'LHE', 'Guangzhou', '20:00:00', 'Delayed'),
('OD131', 'Malindo Air', 'KUL', 'LHE', 'Kuala Lumpur', '20:45:00', 'Estimated'),
('PF743', 'AirSial', 'DMM', 'LHE', 'Dammam', '20:55:00', 'Scheduled'),
('PA415', 'Airblue', 'DXB', 'LHE', 'Dubai', '21:20:00', 'Scheduled'),
('PA406', 'Airblue', 'KHI', 'LHE', 'Karachi', '21:55:00', 'Delayed'),
('TG345', 'Thai Airways', 'BKK', 'LHE', 'Bangkok', '22:30:00', 'Scheduled'),
('5K722', 'HiFly', 'DWC', 'LHE', 'Dubai', '23:30:00', 'Scheduled'),
('9P515', 'FlyJinnah', 'DXB', 'LHE', 'Dubai', '00:35:00', 'Scheduled'),
('SV738', 'Saudi Airlines', 'JED', 'LHE', 'Jeddah', '01:00:00', 'Scheduled'),
('EK622', 'Emirates', 'DXB', 'LHE', 'Dubai', '01:45:00', 'Scheduled'),
('QR620', 'Qatar Airways', 'DOH', 'LHE', 'Doha', '02:00:00', 'Scheduled'),
('J2145', 'Azerbaijan Airlines', 'GYD', 'LHE', 'Baku', '02:05:00', 'Scheduled'),
('YG9181', 'YTO Cargo Airlines', 'URC', 'LHE', 'Urumqi', '02:45:00', 'Scheduled'),
('XY317', 'FlyNas', 'RUH', 'LHE', 'Riyadh', '03:05:00', 'Scheduled'),
('EY284', 'Etihad Airways', 'AUH', 'LHE', 'Abu Dhabi', '03:25:00', 'Scheduled'),
('9P503', 'FlyJinnah', 'SHJ', 'LHE', 'Sharjah', '03:35:00', 'Scheduled');
INSERT INTO arrival VALUES
('OV5637', 'Oman Air', 'MCT', 'ISB', 'Muscat', '02:45:00', 'Scheduled'),
('XY315', 'FlyNas', 'RUH', 'ISB', 'Riyadh', '03:00:00', 'Landed'),
('EY302', 'Etihad Airways', 'AUH', 'ISB', 'Abu Dhabi', '03:25:00', 'Landed'),
('TK710', 'Turkish Airways', 'IST', 'ISB', 'Istanbul', '03:35:00', 'Landed'),
('PK864', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '04:20:00', 'Landed'),
('PK764', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '04:20:00', 'Landed'),
('PK742', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '04:20:00', 'Landed'),
('9P743', 'FlyJinnah', 'SHJ', 'ISB', 'Sharjah', '04:35:00', 'Landed'),
('9P711', 'FlyJinnah', 'DMM', 'ISB', 'Dammam', '04:45:00', 'Landed'),
('9P781', 'FlyJinnah', 'RUH', 'ISB', 'Riyadh', '04:55:00', 'Landed'),
('PK750', 'Pakistan International Airline', 'CDG', 'ISB', 'Paris', '05:05:00', 'Landed'),
('PF769', 'AirSial', 'RUH', 'ISB', 'Riyadh', '06:20:00', 'Landed'),
('PA275', 'Airblue', 'RUH', 'ISB', 'Riyadh', '06:50:00', 'Landed'),
('EK612', 'Emirates', 'DXB', 'ISB', 'Dubai', '07:30:00', 'Landed'),
('TK750', 'Turkish Airways', 'IST', 'ISB', 'Istanbul', '07:45:00', 'Landed'),
('PA231', 'Airblue', 'AUH', 'ISB', 'Abu Dhabi', '07:45:00', 'Scheduled'),
('G9868', 'Air Arabia', 'RKT', 'ISB', 'Ra''sal-Khaymah', '07:55:00', 'Landed'),
('9P735', 'FlyJinnah', 'LHE', 'ISB', 'Lahore', '07:55:00', 'Landed'),
('CZ6007', 'China Southern Airways', 'URC', 'ISB', 'Urumqi', '08:10:00', 'Landed'),
('PK300', 'Pakistan International Airline', 'KHI', 'ISB', 'Karachi', '08:55:00', 'Landed'),
('9P670', 'FlyJinnah', 'KHI', 'ISB', 'Karachi', '08:55:00', 'Landed'),
('PK452', 'Pakistan International Airline', 'KDU', 'ISB', 'Skardu', '09:00:00', 'Landed'),
('PA211', 'Airblue', 'DXB', 'ISB', 'Dubai', '09:00:00', 'Scheduled'),
('QR614', 'Qatar Airways', 'DOH', 'ISB', 'Doha', '09:10:00', 'Landed'),
('PF799', 'AirSial', 'AUH', 'ISB', 'Abu Dhabi', '09:10:00', 'Landed'),
('PF719', 'AirSial', 'JED', 'ISB', 'Jeddah', '10:05:00', 'Scheduled'),
('PA703', 'Airblue', 'KDU', 'ISB', 'Skardu', '12:15:00', 'Landed'),
('PA273', 'Airblue', 'JED', 'ISB', 'Jeddah', '12:15:00', 'Landed'),
('9P741', 'FlyJinnah', 'SHJ', 'ISB', 'Sharjah', '13:10:00', 'Landed'),
('PK462', 'Pakistan International Airline', 'KDU', 'ISB', 'Skardu', '13:50:00', 'Landed'),
('9P857', 'FlyJinnah', 'UET', 'ISB', 'Quetta', '13:50:00', 'Landed'),
('PA200', 'Airblue', 'KHI', 'ISB', 'Karachi', '14:20:00', 'Landed'),
('GF770', 'Gulf Airways', 'BAH', 'ISB', 'Bahrain', '14:30:00', 'Landed'),
('PF123', 'AirSial', 'KHI', 'ISB', 'Karachi', '14:40:00', 'Landed'),
('PK836', 'Pakistan International Airline', 'JED', 'ISB', 'Jeddah', '14:55:00', 'Landed'),
('KA585', 'Aero Nomad', 'BSZ', 'ISB', 'Bishkek', '15:15:00', 'Scheduled'),
('9P672', 'FlyJinnah', 'KHI', 'ISB', 'Karachi', '16:35:00', 'Scheduled'),
('PF735', 'AirSial', 'MCT', 'ISB', 'Muscat', '17:40:00', 'Scheduled'),
('PK308', 'Pakistan International Airline', 'KHI', 'ISB', 'Karachi', '17:55:00', 'Scheduled'),
('9P701', 'FlyJinnah', 'JED', 'ISB', 'Jeddah', '18:05:00', 'Landed'),
('EY300', 'Etihad Airways', 'AUH', 'ISB', 'Abu Dhabi', '18:25:00', 'Landed'),
('PK262', 'Pakistan International Airline', 'AUH', 'ISB', 'Abu Dhabi', '19:15:00', 'Landed'),
('PK288', 'Pakistan International Airline', 'DOH', 'ISB', 'Doha', '19:30:00', 'Scheduled'),
('PK754', 'Pakistan International Airline', 'RUH', 'ISB', 'Riyadh', '20:00:00', 'Scheduled'),
('9P751', 'FlyJinnah', 'LHE', 'ISB', 'Lahore', '20:10:00', 'Scheduled'),
('PF785', 'AirSial', 'DXB', 'ISB', 'Dubai', '20:15:00', 'Scheduled'),
('PF125', 'AirSial', 'KHI', 'ISB', 'Karachi', '20:20:00', 'Landed'),
('9P674', 'FlyJinnah', 'KHI', 'ISB', 'Karachi', '20:30:00', 'Landed'),
('PK212', 'Pakistan International Airline', 'DXB', 'ISB', 'Dubai', '20:40:00', 'Scheduled'),
('PA208', 'Airblue', 'KHI', 'ISB', 'Karachi', '22:05:00', 'Scheduled'),
('TG349', 'Thai Airways', 'BKK', 'ISB', 'Bangkok', '22:10:00', 'Scheduled'),
('BA2161', 'British Airways', 'LGW', 'ISB', 'London', '22:20:00', 'Scheduled'),
('PA217', 'Airblue', 'DXB', 'ISB', 'Dubai', '22:45:00', 'Scheduled'),
('O3233', 'SF Airlines', 'URC', 'ISB', 'Urumqi', '00:35:00', 'Scheduled'),
('EK614', 'Emirates', 'DXB', 'ISB', 'Dubai', '01:15:00', 'Scheduled'),
('QR632', 'Qatar Airways', 'DOH', 'ISB', 'Doha', '01:45:00', 'Scheduled'),

-- ==========================================
-- KARACHI (KHI) FLIGHTS - Monday, Jun 1
-- ==========================================
('EY296', 'Etihad Airways', 'AUH', 'KHI', 'Abu Dhabi', '03:00:00', 'Landed'),
('PC130', 'Pegasus Airlines', 'SAW', 'KHI', 'Istanbul', '03:25:00', 'Landed'),
('TK708', 'Turkish Airways', 'IST', 'KHI', 'Istanbul', '04:20:00', 'Landed'),
('YG9067', 'YTO Cargo Airlines', 'KMG', 'KHI', 'Kunming', '04:45:00', 'Scheduled'),
('9P601', 'FlyJinnah', 'JED', 'KHI', 'Jeddah', '05:40:00', 'Landed'),
('UL151', 'Srilankan Airways', 'CMB', 'KHI', 'Colombo', '05:45:00', 'Landed'),
('F3829', 'Flyadeal', 'JED', 'KHI', 'Jeddah', '07:00:00', 'Landed'),
('QR610', 'Qatar Airways', 'DOH', 'KHI', 'Doha', '08:15:00', 'Landed'),
('PK373', 'Pakistan International Airline', 'ISB', 'KHI', 'Islamabad', '08:55:00', 'Landed'),
('9P841', 'FlyJinnah', 'LHE', 'KHI', 'Lahore', '09:50:00', 'Landed'),
('OV513', 'Oman Air', 'MCT', 'KHI', 'Muscat', '09:55:00', 'Landed'),
('G9542', 'Air Arabia', 'SHJ', 'KHI', 'Sharjah', '10:05:00', 'Landed'),
('FZ333', 'FlyDubai', 'DXB', 'KHI', 'Dubai', '10:40:00', 'Landed'),
('EK600', 'Emirates', 'DXB', 'KHI', 'Dubai', '10:45:00', 'Landed'),
('9P854', 'FlyJinnah', 'UET', 'KHI', 'Quetta', '10:50:00', 'Landed'),
('PA201', 'Airblue', 'ISB', 'KHI', 'Islamabad', '11:05:00', 'Scheduled'),
('PF142', 'AirSial', 'LHE', 'KHI', 'Lahore', '11:25:00', 'Landed'),
('9P671', 'FlyJinnah', 'ISB', 'KHI', 'Islamabad', '11:35:00', 'Landed'),
('PF122', 'AirSial', 'ISB', 'KHI', 'Islamabad', '11:50:00', 'Landed'),
('PK301', 'Pakistan International Airline', 'ISB', 'KHI', 'Islamabad', '11:55:00', 'Landed'),
('SV708', 'Saudi Airlines', 'JED', 'KHI', 'Jeddah', '12:00:00', 'Landed'),
('PK784', 'Pakistan International Airline', 'YYZ', 'KHI', 'Toronto', '12:00:00', 'Landed'),
('PA401', 'Airblue', 'LHE', 'KHI', 'Lahore', '12:10:00', 'Landed'),
('PK502', 'Pakistan International Airline', 'TUK', 'KHI', 'Turbat', '12:25:00', 'Cancelled'),
('9P849', 'FlyJinnah', 'LHE', 'KHI', 'Lahore', '12:30:00', 'Landed'),
('PK341', 'Pakistan International Airline', 'LYP', 'KHI', 'Faisalabad', '12:40:00', 'Landed'),
('PK303', 'Pakistan International Airline', 'LHE', 'KHI', 'Lahore', '12:45:00', 'Landed'),
('PA173', 'Airblue', 'JED', 'KHI', 'Jeddah', '13:45:00', 'Landed'),
('9P821', 'FlyJinnah', 'SKT', 'KHI', 'Sialkot', '14:00:00', 'Landed'),
('9P843', 'FlyJinnah', 'LHE', 'KHI', 'Lahore', '14:55:00', 'Landed'),
('FZ335', 'FlyDubai', 'DXB', 'KHI', 'Dubai', '15:40:00', 'Scheduled'),
('PF162', 'AirSial', 'UET', 'KHI', 'Quetta', '16:10:00', 'Scheduled'),
('G9546', 'Air Arabia', 'SHJ', 'KHI', 'Sharjah', '16:25:00', 'Landed'),
('ET694', 'Ethiopian Airlines', 'ADD', 'KHI', 'Addis Ababa', '16:40:00', 'Landed'),
('PF124', 'AirSial', 'ISB', 'KHI', 'Islamabad', '17:30:00', 'Scheduled'),
('9P866', 'FlyJinnah', 'PEW', 'KHI', 'Peshawar', '17:45:00', 'Scheduled'),
('EY294', 'Etihad Airways', 'AUH', 'KHI', 'Abu Dhabi', '17:50:00', 'Scheduled'),
('PK504', 'Pakistan International Airline', 'GWD', 'KHI', 'Gwadar', '18:00:00', 'Cancelled'),
('PK940', 'Pakistan International Airline', 'JED', 'KHI', 'Jeddah', '18:20:00', 'Landed'),
('PK305', 'Pakistan International Airline', 'LHE', 'KHI', 'Lahore', '18:45:00', 'Scheduled'),
('9P871', 'FlyJinnah', 'MUX', 'KHI', 'Multan', '18:50:00', 'Scheduled'),
('PA207', 'Airblue', 'ISB', 'KHI', 'Islamabad', '18:50:00', 'Scheduled'),
('9P811', 'FlyJinnah', 'LYP', 'KHI', 'Faisalabad', '18:55:00', 'Scheduled'),
('PA405', 'Airblue', 'LHE', 'KHI', 'Lahore', '18:55:00', 'Scheduled'),
('9P673', 'FlyJinnah', 'ISB', 'KHI', 'Islamabad', '19:15:00', 'Scheduled'),
('GF754', 'Gulf Airways', 'BAH', 'KHI', 'Bahrain', '19:15:00', 'Scheduled'),
('9P847', 'FlyJinnah', 'LHE', 'KHI', 'Lahore', '20:10:00', 'Scheduled'),
('PK309', 'Pakistan International Airline', 'ISB', 'KHI', 'Islamabad', '20:55:00', 'Scheduled'),
('EK602', 'Emirates', 'DXB', 'KHI', 'Dubai', '21:05:00', 'Scheduled'),
('PF146', 'AirSial', 'LHE', 'KHI', 'Lahore', '22:25:00', 'Scheduled'),
('FZ329', 'FlyDubai', 'DXB', 'KHI', 'Dubai', '22:55:00', 'Scheduled'),
('9P675', 'FlyJinnah', 'ISB', 'KHI', 'Islamabad', '23:20:00', 'Scheduled'),
('PA111', 'Airblue', 'DXB', 'KHI', 'Dubai', '23:20:00', 'Scheduled'),
('PK319', 'Pakistan International Airline', 'ISB', 'KHI', 'Islamabad', '23:55:00', 'Landed'),
('G9548', 'Air Arabia', 'SHJ', 'KHI', 'Sharjah', '01:00:00', 'Cancelled'),
('PF715', 'AirSial', 'JED', 'KHI', 'Jeddah', '01:10:00', 'Scheduled'),
('SV704', 'Saudi Airlines', 'JED', 'KHI', 'Jeddah', '01:20:00', 'Scheduled'),
('J9507', 'Jazeera Airways', 'KWI', 'KHI', 'Kuwait City', '01:30:00', 'Scheduled'),
('QR604', 'Qatar Airways', 'DOH', 'KHI', 'Doha', '01:45:00', 'Scheduled'),
('PK331', 'Pakistan International Airline', 'MUX', 'KHI', 'Multan', '01:50:00', 'Cancelled');



-- REAL-TIME DEPARTURE STATUS
SELECT 
    cs,
    airl,
    dc AS from_airport,
    cc AS destination,
    d_name AS destination_name,
    times AS scheduled_time,
    CASE
        WHEN stat IN ('Cancelled', 'Delayed') 
            THEN stat  
        WHEN CURTIME() >= times 
            THEN 'Departed'
        WHEN CURTIME() >= SUBTIME(times, '00:30:00') 
            THEN 'Boarding'
        ELSE 'Scheduled'
    END AS live_status
FROM departures
ORDER BY times ASC;


-- REAL-TIME ARRIVAL STATUS
SELECT 
    cs,
    airl,
    cc AS from_city,
    a_name AS origin_name,
    times AS scheduled_time,
    CASE
        WHEN stat IN ('Cancelled', 'Delayed') 
            THEN stat  -- Don't override manual statuses
        WHEN CURTIME() >= times 
            THEN 'Landed'
        WHEN CURTIME() >= SUBTIME(times, '00:30:00') 
            THEN 'Arriving'
        ELSE 'Scheduled'
    END AS live_status
FROM arrival
ORDER BY times ASC;

CREATE EVENT auto_update_flight_status
ON SCHEDULE EVERY 1 MINUTE
DO BEGIN
    UPDATE departures
    SET stat = CASE
        WHEN stat IN ('Cancelled', 'Delayed') THEN stat
        WHEN CURTIME() >= times THEN 'Departed'
        WHEN CURTIME() >= SUBTIME(times, '00:30:00') THEN 'Boarding'
        ELSE 'Scheduled'
    END;

    UPDATE arrival
    SET stat = CASE
        WHEN stat IN ('Cancelled', 'Delayed') THEN stat
        WHEN CURTIME() >= times THEN 'Landed'
        WHEN CURTIME() >= SUBTIME(times, '00:30:00') THEN 'Arriving'
        ELSE 'Scheduled'
    END;
END;


SELECT 
    cs, airl, d_name AS destination, times AS dep_time,
    CASE
        WHEN stat IN ('Cancelled', 'Delayed') THEN stat
        WHEN CURTIME() >= times THEN 'Departed'
        WHEN CURTIME() >= SUBTIME(times, '00:30:00') THEN 'Boarding'
        ELSE 'Scheduled'
    END AS live_status
FROM departures
WHERE dc = 'LHE'  -- For Checking Arrival At Specific Airport
ORDER BY times ASC;



SELECT 
    cs, airl, a_name AS coming_from, times AS arr_time,
    CASE
        WHEN stat IN ('Cancelled', 'Delayed') THEN stat
        WHEN CURTIME() >= times THEN 'Landed'
        WHEN CURTIME() >= SUBTIME(times, '00:30:00') THEN 'Arrived - Taxi'
        ELSE 'Scheduled'
    END AS live_status
FROM arrival
WHERE ac = 'IST'  -- For Checking Arrival By specific Airport
ORDER BY times ASC;

select * from departures order by times asc;
select * from arrival order by times asc;

CREATE USER 'pamr_user'@'localhost'
IDENTIFIED BY 'Ahmed123';

GRANT ALL PRIVILEGES
ON PAMR.*
TO 'pamr_user'@'localhost';

FLUSH PRIVILEGES;

select cc from departures union select cc from arrival;

