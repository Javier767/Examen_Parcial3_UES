--Creacion de Database
CREATE DATABASE VUELOSDW
GO

USE VUELOSDW

--Crear Dimensiones

--dimension de aerolinea
CREATE TABLE DimAirline(
airlineKey int identity (1,1) primary key,
airlineCode Varchar (10), --codigo de aerolinea 
Description Varchar (100))
go

--dimension de tiempo
CREATE TABLE DimTiempo(
fechakey int PRIMARY KEY,
fullDate varchar (50),
nombreDia varchar(25),
diaDeSemana int,
numDiaEnMes int,
mes int,
nombreMes varchar (25),
numSemanaEnAnio int,
trimestre int,
diaLaboral varchar(3), 
anio int
)

--Tabla de Hechos de Vuelos

CREATE TABLE FactVuelo(
    fechaVuelo varchar (50),	
    flightNumberOperatingAirline varchar (50),
    --origen
    originAirportID varchar (50), --id aeropuerto origen segun (DOT) Departamento de Transporte de los Estados Unidos
    originCityName varchar(50),
    originState varchar(50),
    originStateName varchar(100),
    --destino
    destAirportID varchar (50), --id aeropuerto origen segun (DOT) Departamento de Transporte de los Estados Unidos
    destCityName varchar(50),
    destState varchar(50),
    destStateName varchar(100),
    crsDepTime varchar (50),
    depTime varchar (50),
    delayed varchar(50), --retrasado
    depDelayMinutes varchar (50),
    arrDelayMinutes varchar (50),
    wheelsOff varchar (50),
    wheelsOn varchar (50),
    crsArrTime varchar (50),
    arrTime varchar (50),
    canceled varchar (50), --cancelado
    diverted varchar (50), --desviado
    crsElapsedTime varchar (50),
    actualElapsedTime varchar (50),
    airtime varchar (50), --tiempo en el aire
    carrierDelay varchar (50), --retraso del transportista
    weatherDelay varchar(50), --retraso de clima
    nasDelay varchar(50), --National Air System Delay
    securityDelay varchar(50), --retraso de seguridad
    lateAircraftDelay varchar(50), --Retraso tardío de la aeronave
    divAirportLandings varchar (50), --numero de aterrizajes en aeropuertos dif
    divReachedDest varchar(50), --vuelo desv llego a destino
    divActualElapsedTime varchar(50),
    divArrDelay varchar(50),
    fechaKey int,
    airlineKey int,
	FOREIGN KEY(airlineKey) REFERENCES DimAirline(airlineKey),
	FOREIGN KEY(fechaKey) REFERENCES DimTiempo(fechaKey)
);