use airlinedb;



#1 to display passenger based on itinerary
select person.FirstName as FirstName, Passenger_Person_PersonId as ID,Itinerary_ItineraryId as Itinerary,itinerary.Price as Price ,SeatNo as SeatNo 
from flightpassenger 
inner join person
on person.PersonId= Passenger_Person_PersonId
Inner join itinerary
on flightpassenger.Itinerary_ItineraryId = itinerary.ItineraryId
where itinerary.ItineraryId='YH65424'
;



#2 to display passengers and their seat classes
SELECT FlightId,FirstName,LastName,SeatNo,Classname,seatclassaircraft.ClassSeat_SeatClassId from flights
left join flightpassenger
on FlightId=flightpassenger.Flights_FlightId
inner join person
on Passenger_Person_PersonId = PersonId
inner join aircraft
on Aircraft_AircraftId=aircraft.AircraftId
right join seatclassaircraft
on seatclassaircraft.SeatNum = SeatNo
inner join classseat
on seatclassaircraft.ClassSeat_SeatClassId = SeatClassId
where flights.Aircraft_AircraftId =1 and Route_RouteId=2
GROUP BY FirstName;

select * from classseat;

#this is to show all persons and their seat class
SELECT FlightId,FirstName,LastName,SeatNo,Classname,seatclassaircraft.ClassSeat_SeatClassId from flights
left join flightpassenger
on FlightId=flightpassenger.Flights_FlightId
inner join person
on Passenger_Person_PersonId = PersonId
inner join aircraft
on Aircraft_AircraftId=aircraft.AircraftId
right join seatclassaircraft
on seatclassaircraft.SeatNum = SeatNo
inner join classseat
on seatclassaircraft.ClassSeat_SeatClassId = SeatClassId
group by firstname;



#3 to display the bookings made by a specific employee
SELECT person.FirstName as 'Employee First Name', person.LastName 'Employee Last Name', count(Employee_Person_PersonId) as 'Bookings Made' from flightpassenger
INNER JOIN Employee
ON Employee_Person_PersonId =  Person_PersonId
INNER JOIN person
ON PersonId = Employee_Person_PersonId
GROUP BY(Employee_Person_PersonId);



#4 Show list of employees about to retire
drop table retirement_table;

create table if not exists retirement_table  (firstname varchar(25), lastname varchar(25), dob date, age int , desingation varchar(25));


INSERT INTO retirement_table
SELECT firstname,lastname,dob,YEAR(NOW())-YEAR(DOB),employee.Designation from person
INNER JOIN employee
where PersonId= employee.Person_PersonId
AND (YEAR(NOW())-YEAR(DOB))>=64;

select * from retirement_table;


#5 To know which aircraft is preferred more by passengers
Select count(flightpassenger.Passenger_Person_PersonId) as 'No of Passenger',aircraft.Manufacturer from flightpassenger
inner join flights
on flightpassenger.Flights_FlightId = FlightId
inner join aircraft
on flights.Aircraft_AircraftId = AircraftId
GROUP BY (aircraft.Manufacturer) 
ORDER BY (Passenger_Person_PersonId) DESC;



##procedure 1
DELIMITER //
CREATE PROCEDURE dest_facts(IN idFlight int)
BEGIN

SELECT FlightId,route.DestinationAirport,airport.AirportName,country.CountryName,country.Description from Flights
INNER JOIN route
ON RouteId=flights.Route_RouteId
INNER JOIN airport
ON route.DestinationAirport = airport.IataCode
LEFT JOIN country
on airport.Country_CountryCode = country.CountryCode
where flights.FlightId = idFlight;
    

END//
DELIMITER ;

CALL dest_facts(340);



#Procedure 2 to calculate revenue through itinerary
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `catg_revenue`()
BEGIN
Select ItineraryId,Count,Revenue from revenue_thru_itinerary
order by Revenue ASC;
END//
DELIMITER ;

CALL catg_revenue();


#VIEW 1 being used by catg_revenue()
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `revenue_thru_itinerary` AS
    SELECT 
        `i`.`ItineraryId` AS `ItineraryId`,
        COUNT(`i`.`ItineraryId`) AS `Count`,
        SUM(`i`.`Price`) AS `Revenue`
    FROM
        (`flightpassenger` `fp`
        JOIN `itinerary` `i` ON ((`fp`.`Itinerary_ItineraryId` = `i`.`ItineraryId`)))
    GROUP BY `i`.`ItineraryId` WITH ROLLUP;




#VIEW 2 to display flights to and from a place
CREATE VIEW flights_to_or_from AS
SELECT flights.FlightId,route.RouteId, route.OriginAirport, route.DestinationAirport ,flights.ArrivalTime, flights.DepartureTime, flightstatus.Status,ar.Manufacturer,ar.Model
FROM Flights 
INNER JOIN route 
ON flights.Route_RouteId = route.RouteId
INNER JOIN flightstatus
ON flights.FlightStatus_FlightStatusId= flightstatus.FlightStatusId
INNER JOIN aircraft ar
ON flights.Aircraft_AircraftId = ar.AircraftId 
INNER JOIN airport a 
ON route.OriginAirport = a.IataCode 
AND route.DestinationAirport = a.IataCode 
IS NOT NULL;


SELECT * from flights_to_or_from
where OriginAirport = 'BOS'
ORDER BY ArrivalTime DESC;

SELECT * from flights_to_or_from
where DestinationAirport = 'ORD'
ORDER BY DepartureTime ASC;




# Functions
## to check seat availablity
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `is_seat_available`(IdFlight int, IdRoute int, IdAircraft int, seat varchar(4)) RETURNS tinyint(1)
BEGIN

DECLARE var varchar(10);
DECLARE valid boolean;

SET var = '';

SET var = (SELECT flightpassenger.Passenger_Person_PersonId FROM flights
INNER JOIN FlightPassenger
ON FlightId = flightpassenger.Flights_FlightId
WHERE (FlightId=IdFlight AND flights.Route_RouteId=IdRoute AND flights.Aircraft_AircraftId = IdAircraft AND flightpassenger.SeatNo = seat)
);

IF (var != '')
THEN
SET valid = 1;

ELSE
SET valid = 0;
END IF;

return valid;

END//


##2 to check flight duration of a flight using the ID
DELIMITER ..
CREATE DEFINER=`root`@`localhost` FUNCTION `flight_duration`(idFlight int) RETURNS time
BEGIN
	DECLARE duration time;
    
    
    Set duration = (select timediff(arrivaltime,departuretime) as Duration from flights
    where flights.FlightId = idFlight );
    
    
return duration;
    
END
..






#Triggers 
##1 Flight passenger - Checking that no seat is booked twice
#Before Insert and Before Update
CREATE DEFINER=`root`@`localhost` TRIGGER `airlinedb`.`flightpassenger_BEFORE_INSERT` BEFORE INSERT ON `flightpassenger` FOR EACH ROW
BEGIN

DECLARE IdRoute int;
DECLARE IdAircraft int;
DECLARE SeatNo varchar(4);
DECLARE avail boolean;

SET avail = 1;

SET SeatNo = NEW.SeatNo;

SET IdRoute =(SELECT flights.route_routeId FROM flightpassenger
INNER JOIN flights
ON flightpassenger.Flights_FlightId = flights.flightid
WHERE Flights_FlightId = NEW.Flights_FlightId
GROUP BY flights.route_routeId);


SET IdAircraft =(SELECT flights.aircraft_aircraftId FROM flightpassenger
INNER JOIN flights
ON flightpassenger.Flights_FlightId = flights.flightid
WHERE Flights_FlightId = NEW.Flights_FlightId
GROUP BY flights.route_routeId);

 
SET avail = is_seat_available(NEW.Flights_FlightId,IdRoute,IdAircraft,SeatNo);

if(avail = 0)
THEN
set NEW.SeatNo=SeatNo;
ELSE
set NEW.SeatNo='NULL';
END IF;


END
DELIMITER ;


#2 Flights
##Before Update - Making sure Arrival and Departure Time are proper and not same
DELIMITER ..
CREATE DEFINER=`root`@`localhost` TRIGGER `airlinedb`.`flights_BEFORE_UPDATE` BEFORE UPDATE ON `flights` FOR EACH ROW
BEGIN

IF((NEW.ArrivalTime <> OLD.ArrivalTime ) || (NEW.DepartureTime <> OLD.ArrivalTime))
THEN
IF (NEW.ArrivalTime < NEW.DepartureTime)
THEN

SET NEW.DepartureTime = OLD.DepartureTime;
SET NEW.ArrivalTime = OLD.ArrivalTime;

END IF;

SET NEW.Duration = timediff(NEW.arrivaltime,NEW.departuretime);

END IF;
END
..
DELIMITER ;



##3 After update - Flight status is modified then entry is added flight_status_modified 
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `airlinedb`.`flights_STATUS_AFTER_UPDATE` AFTER UPDATE ON `flights` FOR EACH ROW
BEGIN

IF (OLD.FlightStatus_FlightStatusId <> NEW.FlightStatus_FlightStatusId)
THEN

INSERT INTO flight_status_modified 
VALUES(NOW(), NEW.FlightId,NEW.Route_RouteId,NEW.FlightStatus_FlightStatusId,NEW.DepartureTime,NEW.ArrivalTime);
    
END IF;
    
END //

DELIMITER ;

CREATE TABLE IF NOT EXISTS flight_status_modified (Modified_at TIMESTAMP, Flightid int, RouteId int, StatusID int, DeptTime TIME, ArrivalTime TIME);


SELECT * FROM flight_status_modified;



##4 Employee
# Before update and before insert calculation weekly pay
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `airlinedb`.`employee_BEFORE_INSERT` BEFORE INSERT ON `employee` FOR EACH ROW
BEGIN
set new.weeklysalary = new.hours_week * new.pay_hour;
END


//
DELIMITER ;


##5 Itinerary 
# Before insert 
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `airlinedb`.`itinerary_BEFORE_INSERT` BEFORE INSERT ON `itinerary` FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(50);

IF (NEW.Price < 50)
THEN 
SET NEW.Price = 50;
SET msg = 'Setting price to 50$ as it cant be less than that';
INSERT INTO Warning VALUES(NEW.ItineraryId,msg);

END IF;

END

//
DELIMITER ;



#Before Update - it will set to old value 
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `airlinedb`.`itinerary_BEFORE_UPDATE` BEFORE UPDATE ON `itinerary` FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(50);

IF (NEW.Price < 50)
THEN 
SET NEW.Price = OLD.Price;
INSERT INTO Warning VALUES(NEW.ItineraryId,'Setting price to old price as it cant be less than that');

END IF;

END
//
DELIMITER ;