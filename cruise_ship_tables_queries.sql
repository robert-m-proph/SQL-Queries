/* Robert Propheter | Cruise Ship Database  */


CREATE TABLE ships
( ship# CHAR(5),
  ship_name VARCHAR2(15),
  ship_builder VARCHAR2(15),
  launch_date  DATE,
  gross_weight NUMBER(5,0),
	CONSTRAINT ships_ship#_ship_name_pk PRIMARY KEY (ship#, ship_name));

CREATE TABLE cruises
( cruise# CHAR(5),
  ship# CHAR(5),
  ship_name VARCHAR2(15),
  start_date DATE,
  end_date DATE,
  director# CHAR(5),
	CONSTRAINT cruises_cruise#_pk PRIMARY KEY (cruise#),
	CONSTRAINT cruises_ship#_fk FOREIGN KEY (ship#, ship_name)
		REFERENCES ships (ship#, ship_name),
	CONSTRAINT cruises_director#_fk FOREIGN KEY (director#)
		REFERENCES cruise_directors (director#));

CREATE TABLE cruise_directors
( director# CHAR(5),
  first_name VARCHAR2(15),
  last_name VARCHAR2(15),
	CONSTRAINT cruise_directors_director#_pk PRIMARY KEY (director#));

CREATE TABLE cruise_stops
 ( stop# NUMBER (5),
   cruise# CHAR (5),
   port_name CHAR (5),
   arrival_date DATE,
   departure_date DATE,
	CONSTRAINT cruise_stops_stop#_pk PRIMARY KEY (stop#),
	CONSTRAINT cruise_stops_cruise#_fk FOREIGN KEY (cruise#)
		REFERENCES cruises (cruise#),
	CONSTRAINT cruise_stops_port_name_fk FOREIGN KEY (port_name)
		REFERENCES ports (port_name));
        
CREATE TABLE ports
( port_name CHAR(5),
  country VARCHAR2(15),
  docks NUMBER(2,0),
  port_manager_first VARCHAR2(15),
  port_manager_last VARCHAR2(15),
	CONSTRAINT ports_port_name_pk PRIMARY KEY (port_name));
    
INSERT INTO ships (ship#, ship_name, ship_builder, launch_date, gross_weight)
VALUES ('S1001', 'Blue_Voyage', 'MacSam', '15-JAN-10', 20000);
    
INSERT INTO ships (ship#, ship_name, ship_builder, launch_date, gross_weight)
VALUES ('S1015', 'Golden_Gate', 'Parkins', '01-MAR-15', 35000);

  
COMMIT;

INSERT INTO cruise_directors (director#, first_name, last_name)
VALUES ('JS001', 'Robert', 'Propheter');

INSERT INTO cruise_directors (director#, first_name, last_name)
VALUES ('AM001', 'Robert', 'Propheter');

INSERT INTO cruise_directors (director#, first_name, last_name)
VALUES ('CG001', 'Robert', 'Propheter');

INSERT INTO cruise_directors (director#, first_name, last_name)
VALUES ('RP001', 'Robert', 'Propheter');

COMMIT;

INSERT INTO ports (port_name, country, docks, port_manager_first, port_manager_last)
VALUES ('SP1', 'Spain', 12, 'Jose', 'Middle');

INSERT INTO ports (port_name, country, docks, port_manager_first, port_manager_last)
VALUES ('SP2', 'Spain', 5, 'Tizzina', 'Ferlo');

INSERT INTO ports (port_name, country, docks, port_manager_first, port_manager_last)
VALUES ('PR1', 'Portugal', 3, 'Joe', 'Little');

INSERT INTO ports (port_name, country, docks, port_manager_first, port_manager_last)
VALUES ('MX1', 'Mexico', 8, 'Camila', 'Bee');

INSERT INTO ports (port_name, country, docks, port_manager_first, port_manager_last)
VALUES ('MX2', 'Mexico', 6, 'Jennifer', 'Lo');

INSERT INTO ports (port_name, country, docks, port_manager_first, port_manager_last)
VALUES ('IT1', 'Italy', 9, 'Sean', 'Tomack');

INSERT INTO ports (port_name, country, docks, port_manager_first, port_manager_last)
VALUES ('IT2', 'Italy', 4, 'Jessy', 'Bell');

INSERT INTO ports (port_name, country, docks, port_manager_first, port_manager_last)
VALUES ('IT3', 'Italy', 2, 'Omer', 'Hamid');

COMMIT;

INSERT INTO cruises (cruise#, ship#, start_date, end_date, director#)
VALUES ('C20', 'S1001', '15-JAN-18', '21-JAN-18', 'JS001');

INSERT INTO cruises (cruise#, ship#, start_date, end_date, director#)
VALUES ('C25', 'S1001', '01-FEB-18', '07-FEB-18', 'AM001');

INSERT INTO cruises (cruise#, ship#, start_date, end_date, director#)
VALUES ('C30', 'S1015', '15-MAR-18', '25-MAR-18', 'CG001');

UPDATE cruises
 SET ship_name = 'Blue_Voyage'
 WHERE ship# = 'S1001';
 
UPDATE cruises
 SET ship_name = 'Golden_Gate'
 WHERE ship# = 'S1015';
 
COMMIT;

INSERT INTO cruise_stops (stop#, cruise#, port_name, arrival_date, departure_date)
VALUES (120, 'C20', 'SP1', '16-JAN-18', '17-JAN-18');

INSERT INTO cruise_stops (stop#, cruise#, port_name, arrival_date, departure_date)
VALUES (220, 'C20', 'SP2', '18-JAN-18', '19-JAN-18');

INSERT INTO cruise_stops (stop#, cruise#, port_name, arrival_date, departure_date)
VALUES (320, 'C20', 'PR1', '20-JAN-18', '21-JAN-18');

INSERT INTO cruise_stops (stop#, cruise#, port_name, arrival_date, departure_date)
VALUES (125, 'C25', 'MX1', '03-FEB-18', '04-FEB-18');

INSERT INTO cruise_stops (stop#, cruise#, port_name, arrival_date, departure_date)
VALUES (225, 'C25', 'MX2', '05-FEB-18', '07-FEB-18');

INSERT INTO cruise_stops (stop#, cruise#, port_name, arrival_date, departure_date)
VALUES (130, 'C30', 'IT1', '20-MAR-18', '21-MAR-18');

INSERT INTO cruise_stops (stop#, cruise#, port_name, arrival_date, departure_date)
VALUES (230, 'C30', 'IT2', '22-MAR-18', '23-MAR-18');

INSERT INTO cruise_stops (stop#, cruise#, port_name, arrival_date, departure_date)
VALUES (330, 'C30', 'IT3', '24-MAR-18', '25-MAR-18');

SELECT *
FROM ships;

SELECT *
FROM cruise_directors;

SELECT *
FROM ports;

SELECT *
FROM cruises;

SELECT *
FROM cruise_stops;