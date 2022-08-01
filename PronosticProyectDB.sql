USE Master
go

if exists(Select * FROM SysDataBases WHERE name='PronosticProyectDB')
BEGIN
	DROP DATABASE PronosticProyectDB
END
go

CREATE DATABASE PronosticProyectDB
GO

USE PronosticProyectDB
GO 

CREATE TABLE Usuario(
NombreUsuario VARCHAR(20) not null PRIMARY KEY,
Contra VARCHAR(20) not null UNIQUE,
NombreCompleto VARCHAR(50)
)
go

CREATE TABLE Pais(
Codigo VARCHAR(3) not null PRIMARY KEY,
Nombre VARCHAR(20) not null
)
go

CREATE TABLE Ciudad(
CodigoPais VARCHAR(3) not null FOREIGN KEY REFERENCES Pais(Codigo),
CodigoCiudad VARCHAR(3) not null PRIMARY KEY,
NombreCiudad VARCHAR(50) not null
)
go

CREATE TABLE Pronostico(
Codigo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
CodigoCiudad VARCHAR(3)not null FOREIGN KEY REFERENCES Ciudad(CodigoCiudad),
Usuario VARCHAR(20) FOREIGN KEY REFERENCES Usuario(NombreUsuario),
FechaYHora DATETIME,
TemperaturaMAX INT not null,
TemperaturaMIN INT not null,
VelocidadViento INT not null,
TipoDeCielo VARCHAR(20) not null,
ProbLluviasYTormentas BIT not null
)
go

------------------------	SP DE PAISES	------------------------
--------------------------------------------------------------------

CREATE PROCEDURE BuscarPais @codigoPais VARCHAR(3) AS
BEGIN
	SELECT * FROM Pais WHERE Codigo=@codigoPais
END
GO

CREATE PROCEDURE AgregarPais @codigoPais VARCHAR(3), @nombrePais VARCHAR(30) AS
BEGIN
		if (EXISTS (SELECT * FROM Pais WHERE Codigo=@codigoPais))
		RETURN -1 -- ya existe el pais
		
	DECLARE @Error int
	BEGIN TRAN

	INSERT Pais (Codigo, Nombre) VALUES(@codigoPais,@nombrePais) 
	
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1 --no errores
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2 --error
	END	
END 
GO

CREATE PROCEDURE BajaPais @codigoPais VARCHAR(3) AS
BEGIN
	if (exists(SELECT * FROM Pais pa inner join Ciudad ci on pa.Codigo=ci.CodigoPais inner join Pronostico pro on ci.CodigoCiudad=pro.CodigoCiudad where pa.Codigo = @codigoPais))
	return -1 --no se puede eliminar un pais con pronostico asosiado
	
	DECLARE @Error int
	BEGIN TRAN
	
	DELETE Ciudad WHERE CodigoPais = @codigoPais
	SET @Error=@@ERROR+@Error;

	DELETE Pais WHERE Codigo = @codigoPais
	SET @Error=@@ERROR

	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END	
	
END
GO

CREATE PROCEDURE ModificarPais @codigoPais VARCHAR(3), @nombrePais VARCHAR(20) AS
BEGIN
		if Not(EXISTS (SELECT * FROM Pais WHERE Codigo=@codigoPais))
		RETURN -1 --no se puede modifiar pais que no existe.
		
	DECLARE @Error int
	BEGIN TRAN

	UPDATE Pais 
	SET Nombre = @nombrePais
	WHERE Codigo = @codigoPais
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END	
END
GO

CREATE PROCEDURE ListCiudadesDelPais @CodigoPais VARCHAR(3) AS
BEGIN
	SELECT * FROM Ciudad C inner join Pais P on C.CodigoPais = P.Codigo WHERE P.Codigo = @codigoPais
END
GO

CREATE PROCEDURE ListarPaises AS
BEGIN
	SELECT * FROM Pais 
END
GO

CREATE PROCEDURE ListarPaisesDeCiudad @codigoCiudad VARCHAR(3) AS
BEGIN
	SELECT * FROM Ciudad c inner join Pais p on p.Codigo=c.CodigoPais WHERE CodigoCiudad=@codigoCiudad
END
GO

------------------------	SP DE CIUDADES	----------------------------
------------------------------------------------------------------------

CREATE PROCEDURE BuscarCiudad @CodigoC VARCHAR(20) AS
BEGIN
	SELECT * FROM Ciudad WHERE CodigoCiudad=@CodigoC
END
GO

CREATE PROCEDURE AgregarCiudad @codigoCiudad VARCHAR(3), @nombreCiudad VARCHAR(20), @codigoPais VARCHAR(3) AS -- el codigoPais lo tomo del DropDownList
BEGIN
	if(EXISTS (SELECT * FROM Ciudad WHERE CodigoCiudad = @codigoCiudad))
		RETURN -1 -- error ya existe esta ciudad
		
	DECLARE @Error int
	BEGIN TRAN

	INSERT Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES(@codigoPais, @codigoCiudad, @nombreCiudad) 
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END	
END
GO

CREATE PROCEDURE BajaCiudad @codigoCiudad VARCHAR(3) AS
BEGIN
	if not(exists(SELECT * FROM Ciudad WHERE CodigoCiudad=@codigoCiudad))
	return -1 --no se puede eliminar una ciudad ineccistente
	
	DECLARE @Error int
	BEGIN TRAN
	
	DELETE Pronostico WHERE CodigoCiudad = @codigoCiudad
	SET @Error=@@ERROR

	DELETE Ciudad WHERE CodigoCiudad = @codigoCiudad
	SET @Error=@@ERROR+@Error;

	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END	
END
GO

CREATE PROCEDURE ModificoCiudad @codigoCiudad VARCHAR(3), @nombreCiudad VARCHAR(20) AS
BEGIN
		if Not(EXISTS (SELECT * FROM Ciudad WHERE CodigoCiudad=@codigoCiudad))
		RETURN -1 --no se puede modifiar una ciudad que no existe.
		
	DECLARE @Error int
	BEGIN TRAN

	UPDATE Ciudad 
	SET NombreCiudad = @nombreCiudad
	WHERE CodigoCiudad = @codigoCiudad
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END
END
GO

CREATE PROCEDURE ListarCiudadesDePaises @codigoPais VARCHAR(3) AS
BEGIN
	SELECT * FROM Pais P inner join Ciudad C on P.Codigo = C.CodigoPais WHERE P.Codigo = @codigoPais
END
GO

CREATE PROCEDURE ListarCiudades AS
BEGIN
	SELECT * FROM Ciudad
END
GO
------------------------	SP DE USUARIOS EMPLEADOS	------------------------
--------------------------------------------------------------------------------

CREATE PROCEDURE AltaEmp @NombreUsuario Varchar(20), @Contra VARCHAR(20), @NombreCompleto VARCHAR(50) AS
BEGIN
		if(EXISTS (SELECT * FROM Usuario WHERE NombreUsuario = @NombreUsuario))
		RETURN -1 -- error ya existe este empleado

		
	DECLARE @Error int
	BEGIN TRAN

	INSERT Usuario(NombreUsuario, Contra, NombreCompleto) VALUES(@NombreUsuario, @Contra, @NombreCompleto) 
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END	
END 
GO

CREATE PROCEDURE EliminarEmp @nombreUsu VARCHAR(20) AS
BEGIN
	if NOT(EXISTS(SELECT * FROM Usuario WHERE NombreUsuario=@nombreUsu))
	return -1 --error no se puede eliminar usuario que no existe
	
	if (exists(SELECT * FROM Usuario u inner join Pronostico p on u.NombreUsuario=p.Usuario where NombreUsuario=@nombreUsu))
	return -2 --error no se puede eliminar usuario con pronostico asosiado
	
	DECLARE @Error int
	BEGIN TRAN

	DELETE Usuario WHERE NombreUsuario = @nombreUsu
	SET @Error=@@ERROR+@Error;

	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -3
	END	
END
GO

CREATE PROCEDURE ModificarEmp @nombreUsu VARCHAR(20), @nombreCompleto VARCHAR(50), @contra VARCHAR(20) AS
BEGIN
	IF not(exists(SELECT * FROM Usuario WHERE NombreUsuario=@nombreUsu))
	return -1 --error no se puede modificar usuario inexistente.
	
	DECLARE @Error int
	BEGIN TRAN
	
	UPDATE Usuario 
	SET Contra = @contra, NombreCompleto = @nombreCompleto
	WHERE NombreUsuario = @nombreUsu
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END
END
GO

CREATE PROCEDURE Logear @NombreUsuario Varchar(20), @Contra VARCHAR(20) AS
BEGIN
	IF(NOT EXISTS(SELECT * FROM Usuario WHERE NombreUsuario=@NombreUsuario and Contra=@Contra))
	RETURN -1
	SELECT * FROM Usuario WHERE NombreUsuario=@NombreUsuario and Contra=@Contra
END
GO

CREATE PROCEDURE BuscarUsuarioEmp @NombreUsuario VARCHAR(20) AS
BEGIN
	SELECT * FROM Usuario WHERE NombreUsuario=@NombreUsuario
END
GO

------------------------	SP DE PRONOSTICOS	------------------------
------------------------------------------------------------------------

CREATE PROCEDURE ListPronosticosDeHoy AS
BEGIN
	SELECT * FROM Pronostico WHERE CONVERT(DATE,FechaYHora) = CONVERT(DATE,GETDATE()) ORDER BY FechaYHora DESC
END
GO

CREATE PROCEDURE ListPronosticosDeCiudad @codigoCiudad VARCHAR(3) AS
BEGIN
	SELECT * FROM Pronostico WHERE CodigoCiudad = @codigoCiudad
END
GO

CREATE PROCEDURE AgregarPronostico @Ciudad VARCHAR(20), @Usuario VARCHAR(20), @FechaYHora DATETIME, @TemperaturaMAX INT, @TemperaturaMIN INT, @VelocidadViento INT, @TipoDeCielo VARCHAR(20), @ProbLluviasYTormentas BIT AS
BEGIN
		if(EXISTS (SELECT * FROM Pronostico WHERE FechaYHora=@FechaYHora and CodigoCiudad=@Ciudad))
			RETURN -1 --no se puede agregar un pronostico ya existente

		
	DECLARE @Error int
	BEGIN TRAN

	INSERT Pronostico(CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) 
	VALUES(@Ciudad, @Usuario, @FechaYHora, @TemperaturaMAX, @TemperaturaMIN, @VelocidadViento, @TipoDeCielo, @ProbLluviasYTormentas) 
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1 --no hubo problemas, transaccion completa
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2--error no se realiza la transaccion
	END	
END
GO

CREATE PROCEDURE PronosticoParaLaFecha @fecha DATETIME AS
BEGIN	
	SELECT * FROM Pronostico WHERE CONVERT(DATE,FechaYHora) = CONVERT(DATE,@fecha) ORDER BY FechaYHora DESC
END
GO

-- COMADOS DE PRUEVA
------------------------------------------------------------------------
exec ListarPaisesDeCiudad 'arb'
select * from Pais

-------------------------------------------------------------------------------------------------------------------------
-- DATOS DE PRUEBA --

--Usuarios
INSERT INTO Usuario (NombreUsuario, Contra, NombreCompleto) VALUES ('pepito123', 'Inhakeable123', 'Pepe Roberto Sanchez')
INSERT INTO Usuario (NombreUsuario, Contra, NombreCompleto) VALUES ('Juansito123', 'Lapizera123', 'Juan Carlos')
INSERT INTO Usuario (NombreUsuario, Contra, NombreCompleto) VALUES ('TeMagic123', 'TazaAzul23', 'Pablo Matsumoto')
INSERT INTO Usuario (NombreUsuario, Contra, NombreCompleto) VALUES ('admin', 'admin', 'Marcos Cabrera')
INSERT INTO Usuario (NombreUsuario, Contra, NombreCompleto) VALUES ('Usuario123', 'Contra123', 'Martin Nicolas')
INSERT INTO Usuario (NombreUsuario, Contra, NombreCompleto) VALUES ('PEW', 'BOOM', 'Sofia Bentancour')
go
--Paises
INSERT INTO Pais (Codigo, Nombre) VALUES ('URU', 'Uruguay')
INSERT INTO Pais (Codigo, Nombre) VALUES ('ARG', 'Argentina')
INSERT INTO Pais (Codigo, Nombre) VALUES ('DEU', 'Alemania')
INSERT INTO Pais (Codigo, Nombre) VALUES ('CHN', 'China')
INSERT INTO Pais (Codigo, Nombre) VALUES ('CAN', 'Canada')
INSERT INTO Pais (Codigo, Nombre) VALUES ('JPN', 'Japon')
INSERT INTO Pais (Codigo, Nombre) VALUES ('CHE', 'Suiza')
INSERT INTO Pais (Codigo, Nombre) VALUES ('CHL', 'Chile')
INSERT INTO Pais (Codigo, Nombre) VALUES ('NZL', 'Nueva Zelanda')
go
--Ciudades
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('URU', 'UYM', 'Montevideo')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('URU', 'UYR', 'Rivera')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('URU', 'UYP', 'Paysandu')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('ARG', 'ARB', 'Buenos Aires')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('DEU', 'DEB', 'Berlin')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('CHN', 'CHP', 'Pekin')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('CAN', 'CAO', 'Ottawa')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('JPN', 'JPT', 'Tokio')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('CHE', 'CHB', 'Berna')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('CHL', 'CHS', 'Santiago')
INSERT INTO Ciudad(CodigoPais, CodigoCiudad, NombreCiudad) VALUES ('NZL', 'NZW', 'Wellington')
go
--Pronosticos
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('UYM', 'Usuario123', '20220709 21:36:03', 12, 4, 1, 'Parcialmente nuboso', 1)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('UYR', 'admin', '20220709 21:36:03', 10, 2, 1, 'Despejado', 0)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('UYP', 'PEW', '20220706 21:36:03', 20, 15, 1, 'Parcialmente nuboso', 0)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('UYM', 'Usuario123', '20220709 21:36:03', 7, 1, 1, 'Nuboso', 1)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('UYM', 'admin', '20220710 21:36:03', 11, 6, 1, 'Parcialmente nuboso', 1)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('UYR', 'PEW', '20220711 21:36:03', 17, 12, 1, 'Nuboso', 0)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('UYP', 'TeMagic123', '20220709 21:36:03', 10, 5, 1, 'Nuboso', 1)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('UYP', 'admin', '20220712 21:36:03', 15, 8, 1, 'Parcialmente nuboso', 0)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('ARB', 'Juansito123', '20220709 03:07:47', 20, 15, 26, 'Nuboso', 1)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('CHB', 'PEW', '20220703 14:56:15', 23, 19, 3, 'Parcialmente nuboso', 1)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('NZW', 'TeMagic123', '20220524 15:47:23', 25, 21, 50, 'Nuboso', 1)
INSERT INTO Pronostico (CodigoCiudad, Usuario, FechaYHora, TemperaturaMAX, TemperaturaMIN, VelocidadViento, TipoDeCielo, ProbLluviasYTormentas) VALUES ('JPT', 'admin', '20220630 06:24:56', 7, 4, 12, 'Despejado', 0)
go