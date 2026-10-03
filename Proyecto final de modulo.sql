CREATE DATABASE FlyUS_Airlines;
GO

USE FlyUS_Airlines;
GO

-- =========================================================
-- CREACIÓN DE TABLAS
-- =========================================================

CREATE TABLE Pasajeros (
    ID INT PRIMARY KEY IDENTITY(1,1),
    NombreCompleto NVARCHAR(100),
    Correo VARCHAR(50),
    Telefono VARCHAR(20),
    DocumentoIdentidad VARCHAR(20),
    Nacionalidad NVARCHAR(50)
);

CREATE TABLE Aeropuertos (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50),
    Ciudad NVARCHAR(50),
    Pais NVARCHAR(50),
    CodigoIATA CHAR(3) UNIQUE,
    Capacidad INT
);

CREATE TABLE Aviones (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Modelo NVARCHAR(50),
    Fabricante NVARCHAR(50),
    Capacidad INT,
    AñoFabricacion INT,
    Estado NVARCHAR(20)
);

CREATE TABLE Vuelos (
    ID INT PRIMARY KEY IDENTITY(1,1),
    CodigoVuelo VARCHAR(10),
    AeropuertoOrigenID INT,
    AeropuertoDestinoID INT,
    AvionesID INT,
    FechaSalida DATETIME,
    FechaEntrada DATETIME,
    Precio DECIMAL(10,2),
    Estado VARCHAR(20),

    FOREIGN KEY (AeropuertoOrigenID)
        REFERENCES Aeropuertos(ID),

    FOREIGN KEY (AeropuertoDestinoID)
        REFERENCES Aeropuertos(ID),

    FOREIGN KEY (AvionesID)
        REFERENCES Aviones(ID)
);

CREATE TABLE Reservas (
    ID INT PRIMARY KEY IDENTITY(1,1),
    PasajeroID INT,
    VuelosID INT,
    Asiento VARCHAR(5),
    Clase VARCHAR(20),
    Estado VARCHAR(20),

    FOREIGN KEY (PasajeroID)
        REFERENCES Pasajeros(ID),

    FOREIGN KEY (VuelosID)
        REFERENCES Vuelos(ID)
);

CREATE TABLE Empleados (
    ID INT PRIMARY KEY IDENTITY(1,1),
    NombreCompleto NVARCHAR(100),
    Cargo NVARCHAR(100),
    Salario DECIMAL(10,2),
    FechaContratacion DATE,
    AeropuertoID INT,

    FOREIGN KEY (AeropuertoID)
        REFERENCES Aeropuertos(ID)
);
GO


-- =========================================================
-- INSERTAR PASAJEROS
-- =========================================================

INSERT INTO Pasajeros
    (NombreCompleto, Correo, Telefono, DocumentoIdentidad, Nacionalidad)
VALUES
    ('Carlos Rodriguez', 'carlos.rodriguez@gmail.com', '809-555-1961', '001-1234567-1', 'Dominicana'),
    ('Yuki Tanaka', 'yuki.tanaka@gmail.com', '090-1234-5678', 'JP-458721', 'Japonesa'),
    ('Juan Canono', 'juan.cano@gmail.com', '809-112-3456', 'IT-6789234', 'Italiana'),
    ('Lina Cooner', 'lina.cooner@gmail.com', '881-112-3456', 'IT-6789234', 'Italiana'),
    ('Anafa Okafor', 'amafa.okafor@gmail.com', '0888-123-4567', 'NG-345678', 'Nigeriana'),
    ('Sofia Petrov', 'sofia.petrov@gmail.com', '8888-123-4567', 'BG-782341', 'Bulgara'),
    ('Marco Alvarez', 'marco.alvarez@gmail.com', '111-123-4567', 'AR-563829', 'Argentina'),
    ('Ingrid Larsen', 'ingrid.larsen@gmail.com', '412-544-5671', 'NO-304271', 'Noruega'),
    ('Omar Haddad', 'omar.haddad@gmail.com', '123-111-4566', 'LB-3945521', 'Libanesa'),
    ('Priya Nair', 'priya.nair@gmail.com', '99876-54321', 'IN-612374', 'India'),
    ('Thiago Oliveira', 'thiago.oliveira@gmail.com', '011-912-7738', 'BR-914628', 'Brasileña');


-- =========================================================
-- INSERTAR AEROPUERTOS
-- =========================================================

INSERT INTO Aeropuertos
    (Nombre, Ciudad, Pais, CodigoIATA, Capacidad)
VALUES
    ('Los Americas', 'Santo Domingo', 'Republica Dominicana', 'SDQ', 5000000),
    ('John F Kennedy', 'Nueva York', 'Estados Unidos', 'JFK', 62000000),
    ('Charles de Gaulle', 'Paris', 'Francia', 'CDG', 70000000),
    ('Haneda', 'Tokio', 'Japon', 'HND', 87000000),
    ('Heathrow', 'Londres', 'Reino Unido', 'LHR', 80000000),
    ('El Dorado', 'Bogota', 'Colombia', 'BOG', 40000000),
    ('Dubai International', 'Dubai', 'Emiratos Arabes Unidos', 'DXB', 90000000),
    ('Guarulhos', 'Sao Paulo', 'Brasil', 'GRU', 43000000),
    ('Sydney Kingsford Smith', 'Sydney', 'Australia', 'SYD', 56000000),
    ('Cape Town International', 'Ciudad del Cabo', 'Sudafrica', 'CPT', 11000000);


-- =========================================================
-- INSERTAR AVIONES
-- =========================================================

INSERT INTO Aviones
    (Modelo, Fabricante, Capacidad, AñoFabricacion, Estado)
VALUES
    ('737-800', 'Boeing', 189, 2018, 'Activo'),
    ('A320-200', 'Airbus', 180, 2019, 'Activo'),
    ('787-9 Dreamliner', 'Boeing', 296, 2021, 'Activo'),
    ('A350-900', 'Airbus', 325, 2022, 'Activo'),
    ('737 MAX 8', 'Boeing', 178, 2020, 'Activo'),
    ('A321neo', 'Airbus', 220, 2023, 'Activo'),
    ('777-300ER', 'Boeing', 396, 2017, 'Mantenimiento'),
    ('A330-300', 'Airbus', 300, 2016, 'Activo'),
    ('Embraer E190', 'Embraer', 100, 2020, 'Activo'),
    ('ATR 72-600', 'ATR', 72, 2019, 'Inactivo');


-- =========================================================
-- INSERTAR VUELOS
-- =========================================================

INSERT INTO Vuelos
    (CodigoVuelo, AeropuertoOrigenID, AeropuertoDestinoID, AvionesID,
     FechaSalida, FechaEntrada, Precio, Estado)
VALUES
    ('FU101', 1, 2, 1, '2026-09-05 08:00', '2026-09-05 12:30', 450.00, 'Programado'),
    ('FU102', 2, 3, 2, '2026-09-06 09:00', '2026-09-06 18:00', 720.00, 'Programado'),
    ('FU103', 3, 4, 3, '2026-09-07 13:30', '2026-09-08 06:00', 1100.00, 'Programado'),
    ('FU104', 4, 5, 4, '2026-09-08 10:00', '2026-09-08 17:30', 850.00, 'Programado'),
    ('FU105', 5, 6, 5, '2026-09-09 07:45', '2026-09-09 13:30', 680.00, 'Programado'),
    ('FU106', 6, 7, 6, '2026-09-10 11:00', '2026-09-10 22:00', 1250.00, 'Programado'),
    ('FU107', 7, 8, 7, '2026-09-11 16:00', '2026-09-11 23:30', 950.00, 'Programado'),
    ('FU108', 8, 9, 8, '2026-09-12 08:30', '2026-09-12 20:00', 1350.00, 'Programado'),
    ('FU109', 9, 10, 9, '2026-09-13 14:00', '2026-09-14 06:00', 1450.00, 'Programado'),
    ('FU110', 10, 1, 10, '2026-09-14 09:00', '2026-09-15 01:30', 1200.00, 'Programado');


-- =========================================================
-- INSERTAR RESERVAS
-- =========================================================

INSERT INTO Reservas
    (PasajeroID, VuelosID, Asiento, Clase, Estado)
VALUES
    (1, 1, '12A', 'Economica', 'Confirmada'),
    (2, 2, '08B', 'Ejecutiva', 'Confirmada'),
    (3, 3, '21C', 'Economica', 'Independiente'),
    (4, 4, '03A', 'Primera', 'Confirmada'),
    (5, 5, '15D', 'Economica', 'Confirmada'),
    (6, 6, '07F', 'Ejecutiva', 'Cancelada'),
    (7, 7, '18A', 'Economica', 'Confirmada'),
    (8, 8, '02C', 'Primera', 'Confirmada'),
    (9, 9, '24B', 'Economica', 'Pendiente'),
    (10, 10, '11E', 'Ejecutiva', 'Confirmada');


-- =========================================================
-- INSERTAR EMPLEADOS
-- =========================================================

INSERT INTO Empleados
    (NombreCompleto, Cargo, Salario, FechaContratacion, AeropuertoID)
VALUES
    ('Miguel Santos', 'Piloto', 8500.00, '2021-03-15', 1),
    ('Emma Thompson', 'Gerente de Operaciones', 6200.00, '2020-07-20', 2),
    ('Kenji Yamamoto', 'Controlador Aereo', 5000.00, '2022-01-10', 3),
    ('Sophie Martin', 'Agente de Servicio', 3200.00, '2023-05-12', 4),
    ('James Anderson', 'Mecanico de Aeronaves', 4700.00, '2021-11-08', 5),
    ('Laura Gomez', 'Supervisora', 5200.00, '2019-09-25', 6),
    ('Ahmed Hassan', 'Piloto', 8300.00, '2024-01-18', 7),
    ('Lucas Oliveira', 'Agente de Seguridad', 3500.00, '2023-02-14', 8),
    ('Olivia Wilson', 'Asistente de Vuelo', 3800.00, '2022-08-30', 9),
    ('Thabo Mokoena', 'Tecnico de Mantenimiento', 4500.00, '2021-06-05', 10);


-- =========================================================
-- CONSULTAS BÁSICAS
-- =========================================================

SELECT * FROM Pasajeros;

SELECT * FROM Aeropuertos;

SELECT * FROM Aviones;

SELECT * FROM Vuelos;

SELECT * FROM Reservas;

SELECT * FROM Empleados;


-- Pasajeros dominicanos

SELECT *
FROM Pasajeros
WHERE Nacionalidad = 'Dominicana';


-- Nacionalidades existentes

SELECT DISTINCT Nacionalidad
FROM Pasajeros;


-- Aviones ordenados por capacidad

SELECT Modelo, Fabricante, Capacidad
FROM Aviones
ORDER BY Capacidad DESC;


-- Vuelos con precio mayor a 1000

SELECT *
FROM Vuelos
WHERE Precio > 1000;


-- Vuelos con precio menor a 800

SELECT CodigoVuelo, Precio
FROM Vuelos
WHERE Precio < 800;


-- Aviones fabricados hasta 2018

SELECT Modelo, AñoFabricacion
FROM Aviones
WHERE AñoFabricacion <= 2018;


-- Aviones fabricados desde 2018

SELECT Modelo, AñoFabricacion
FROM Aviones
WHERE AñoFabricacion >= 2018;


-- Aviones que no están activos

SELECT Modelo, Estado
FROM Aviones
WHERE Estado <> 'Activo';


-- Aeropuertos con capacidad entre 70 y 100 millones

SELECT Nombre, Capacidad
FROM Aeropuertos
WHERE Capacidad BETWEEN 70000000 AND 100000000;


-- Reservas de primera clase o ejecutiva

SELECT Asiento, Clase
FROM Reservas
WHERE Clase IN ('Primera', 'Ejecutiva');


-- Empleados que no son pilotos

SELECT NombreCompleto, Cargo
FROM Empleados
WHERE Cargo NOT IN ('Piloto');


-- Empleados cuyo nombre comienza con M

SELECT NombreCompleto, Cargo, Salario
FROM Empleados
WHERE NombreCompleto LIKE 'M%';


-- Aeropuertos cuyo nombre termina en S

SELECT Nombre, Ciudad, Pais
FROM Aeropuertos
WHERE Nombre LIKE '%s';


-- Aviones cuyo modelo contiene la letra T

SELECT Modelo, Fabricante, AñoFabricacion
FROM Aviones
WHERE Modelo LIKE '%t%';


-- Vuelos ordenados por fecha de salida descendente

SELECT CodigoVuelo, FechaSalida, FechaEntrada
FROM Vuelos
ORDER BY FechaSalida DESC;


-- Vuelos ordenados por fecha de entrada ascendente

SELECT CodigoVuelo, FechaEntrada, FechaSalida
FROM Vuelos
ORDER BY FechaEntrada ASC;


-- Empleados ordenados por salario y fecha de contratación

SELECT Salario, FechaContratacion
FROM Empleados
ORDER BY Salario ASC, FechaContratacion DESC;


-- =========================================================
-- FUNCIONES DE AGREGACIÓN
-- =========================================================

-- Cantidad de pasajeros por nacionalidad

SELECT Nacionalidad, COUNT(*) AS Total
FROM Pasajeros
GROUP BY Nacionalidad;


-- Suma de precios por estado del vuelo

SELECT Estado, SUM(Precio) AS TotalPrecios
FROM Vuelos
GROUP BY Estado;


-- Salario promedio por cargo

SELECT Cargo, AVG(Salario) AS SalarioPromedioPorCargo
FROM Empleados
GROUP BY Cargo;


-- Capacidad máxima de aviones por estado

SELECT Estado, MAX(Capacidad) AS MaximaCapacidad
FROM Aviones
GROUP BY Estado;


-- Capacidad mínima de aviones por estado

SELECT Estado, MIN(Capacidad) AS MinimaCapacidad
FROM Aviones
GROUP BY Estado;


-- Estados de aviones que tienen exactamente un avión

SELECT Estado, COUNT(*) AS CantidadAviones
FROM Aviones
GROUP BY Estado
HAVING COUNT(*) = 1;


-- Cargos cuya suma de salarios supera 5000

SELECT Cargo, SUM(Salario) AS TotalSalarios
FROM Empleados
GROUP BY Cargo
HAVING SUM(Salario) > 5000;


-- =========================================================
-- CASE
-- =========================================================

-- Clasificar vuelos según su precio

SELECT
    CodigoVuelo,
    Precio,
    CASE
        WHEN Precio <= 500 THEN 'Economico'
        WHEN Precio > 500 AND Precio < 1000 THEN 'Intermedio'
        ELSE 'Caro'
    END AS CategoriaPrecio
FROM Vuelos
ORDER BY Precio ASC;


-- Clasificar aviones según su año de fabricación

SELECT
    Modelo,
    Fabricante,
    AñoFabricacion,
    CASE
        WHEN AñoFabricacion < 2020 THEN 'Viejo'
        ELSE 'Nuevo'
    END AS Antiguedad
FROM Aviones;


-- =========================================================
-- INNER JOIN
-- =========================================================

-- Información de pasajeros, reservas y vuelos

SELECT
    p.NombreCompleto,
    p.Nacionalidad,
    r.Asiento,
    r.Clase,
    r.Estado AS EstadoReserva,
    v.CodigoVuelo,
    v.Precio,
    v.Estado AS EstadoVuelo
FROM Pasajeros p
INNER JOIN Reservas r
    ON p.ID = r.PasajeroID
INNER JOIN Vuelos v
    ON v.ID = r.VuelosID;


-- Información de aviones y sus vuelos

SELECT
    a.Modelo,
    a.Fabricante,
    a.Capacidad,
    a.Estado AS EstadoAvion,
    v.CodigoVuelo,
    v.Estado AS EstadoVuelo,
    v.FechaSalida,
    v.FechaEntrada
FROM Aviones a
INNER JOIN Vuelos v
    ON v.AvionesID = a.ID;


-- =========================================================
-- LEFT JOIN / RIGHT JOIN
-- =========================================================

-- Todos los aeropuertos y sus empleados,
-- incluyendo aeropuertos sin empleados

SELECT
    ae.Nombre AS Aeropuerto,
    ae.Ciudad,
    e.NombreCompleto AS Empleado,
    e.Cargo
FROM Aeropuertos ae
LEFT JOIN Empleados e
    ON ae.ID = e.AeropuertoID;


-- Todos los aeropuertos de origen y sus vuelos

SELECT
    ae.Nombre AS AeropuertoOrigen,
    v.CodigoVuelo,
    v.FechaSalida
FROM Aeropuertos ae
LEFT JOIN Vuelos v
    ON ae.ID = v.AeropuertoOrigenID;


-- Todos los vuelos y el aeropuerto de destino

SELECT
    v.CodigoVuelo,
    ae.Nombre AS AeropuertoDestino,
    ae.Ciudad,
    ae.Pais
FROM Vuelos v
RIGHT JOIN Aeropuertos ae
    ON v.AeropuertoDestinoID = ae.ID;


-- =========================================================
-- CONSULTA CON MÚLTIPLES JOIN
-- =========================================================

SELECT
    a.Modelo,
    a.Fabricante,
    a.Capacidad,
    a.Estado AS EstadoAvion,
    v.CodigoVuelo,
    v.Estado AS EstadoVuelo,
    v.FechaSalida,
    v.FechaEntrada,
    origen.Nombre AS AeropuertoOrigen,
    origen.Ciudad AS CiudadOrigen,
    destino.Nombre AS AeropuertoDestino,
    destino.Ciudad AS CiudadDestino
FROM Aviones a
INNER JOIN Vuelos v
    ON v.AvionesID = a.ID
INNER JOIN Aeropuertos origen
    ON origen.ID = v.AeropuertoOrigenID
INNER JOIN Aeropuertos destino
    ON destino.ID = v.AeropuertoDestinoID;


-- Información de pilotos y el aeropuerto donde trabajan

SELECT
    e.NombreCompleto,
    e.Cargo,
    e.Salario,
    ae.Nombre AS Aeropuerto,
    ae.Ciudad,
    ae.Pais
FROM Empleados e
INNER JOIN Aeropuertos ae
    ON e.AeropuertoID = ae.ID
WHERE e.Cargo = 'Piloto';


-- =========================================================
-- PROCEDIMIENTOS ALMACENADOS
-- =========================================================

-- Mostrar todas las tablas

CREATE PROCEDURE VerTablas
AS
BEGIN
    SELECT * FROM Pasajeros;
    SELECT * FROM Aeropuertos;
    SELECT * FROM Aviones;
    SELECT * FROM Vuelos;
    SELECT * FROM Reservas;
    SELECT * FROM Empleados;
END;
GO

EXEC VerTablas;
GO


-- Buscar pasajeros por nacionalidad

CREATE PROCEDURE VerPasajerosPorNacionalidad
    @Nacionalidad NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Pasajeros
    WHERE Nacionalidad = @Nacionalidad;
END;
GO

EXEC VerPasajerosPorNacionalidad 'Dominicana';
GO


-- Agregar un pasajero

CREATE PROCEDURE AgregarPasajero
    @NombreCompleto NVARCHAR(100),
    @Correo VARCHAR(50),
    @Telefono VARCHAR(20),
    @DocumentoIdentidad VARCHAR(20),
    @Nacionalidad NVARCHAR(50)
AS
BEGIN
    INSERT INTO Pasajeros
        (NombreCompleto, Correo, Telefono, DocumentoIdentidad, Nacionalidad)
    VALUES
        (@NombreCompleto, @Correo, @Telefono, @DocumentoIdentidad, @Nacionalidad);
END;
GO

EXEC AgregarPasajero
    'Maria Ramirez',
    'maria@gmail.com',
    '809-445-7690',
    '402-4582484-4',
    'Japonesa';
GO


-- Verificar si un vuelo está programado

CREATE PROCEDURE VerificarVuelo
    @CodigoVuelo VARCHAR(10)
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM Vuelos
        WHERE Estado = 'Programado'
          AND CodigoVuelo = @CodigoVuelo
    )
    BEGIN
        PRINT 'El vuelo se encuentra listo y programado.';
    END
    ELSE
    BEGIN
        PRINT 'El vuelo no se encuentra disponible.';
    END
END;
GO

EXEC VerificarVuelo 'FU113';
GO


-- =========================================================
-- TRIGGERS
-- =========================================================

-- Validar salario mínimo

CREATE TRIGGER ValidarSalario
ON Empleados
AFTER INSERT
AS
BEGIN

    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE Salario < 1000
    )
    BEGIN
        ROLLBACK TRANSACTION;

        PRINT 'Error: El salario no puede ser menor de 1000.';
    END

END;
GO


-- Mostrar mensaje cuando se registra un empleado

CREATE TRIGGER NuevoEmpleado
ON Empleados
AFTER INSERT
AS
BEGIN
    PRINT 'Se ha registrado un nuevo empleado.';
END;
GO


-- =========================================================
-- PRUEBA DEL TRIGGER
-- =========================================================

-- Este INSERT será rechazado por el trigger
-- porque el salario es menor de 1000.

INSERT INTO Empleados
    (NombreCompleto, Salario)
VALUES
    ('Marcos Santana', 800);
GO


-- =========================================================
-- REPORTE FINAL
-- =========================================================

SELECT
    ae.Nombre AS Aeropuerto,
    COUNT(e.ID) AS CantidadEmpleados,

    CASE
        WHEN COUNT(e.ID) < 2 THEN 'Pocos empleados'
        WHEN COUNT(e.ID) BETWEEN 2 AND 3 THEN 'Cantidad media'
        ELSE 'Muchos empleados'
    END AS Categoria

FROM Aeropuertos ae

LEFT JOIN Empleados e
    ON ae.ID = e.AeropuertoID

GROUP BY ae.Nombre
ORDER BY CantidadEmpleados DESC;
GO