USE [dbEmpleado]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 09/02/2022 23:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](50) NULL,
	[apellido] [nchar](50) NOT NULL,
	[direccion] [nchar](100) NOT NULL,
	[telefono] [nchar](8) NULL,
	[idPuesto] [int] NOT NULL,
	[dpi] [nchar](13) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[estado] [tinyint] NULL,
	[fechaNac] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puestos]    Script Date: 09/02/2022 23:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puestos](
	[idPuesto] [int] IDENTITY(1,1) NOT NULL,
	[puesto] [nchar](60) NOT NULL,
	[estado] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_empleados]    Script Date: 09/02/2022 23:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[sp_empleados]
    @i_id int = null, 
    @i_estado int = null,   
	@i_idPuesto int = null,   
	@i_nombre varchar(50) = null,
	@i_apellido varchar(50) = null,
	@i_direccion varchar(100) = null,
	@i_telefono varchar(8) = null, 
	@i_dpi varchar(13) = null, 
	@i_fechaNac varchar(13) = null, 
    @i_operacion int 

	
AS
DECLARE @ultimoid INT
BEGIN



IF @i_operacion = 1
        BEGIN TRY
            BEGIN TRANSACTION

                -- REALIZAMOS LA INSERCION DE DATOS A LA TABLA ROL
                INSERT INTO empleados (nombre,apellido,direccion,telefono,
				dpi,idPuesto,fechaCreacion,estado,fechaNac)
				VALUES (@i_nombre,@i_apellido,@i_direccion,@i_telefono,
				@i_dpi,@i_idPuesto,GETDATE(),1,@i_fechaNac);
		
		   COMMIT TRANSACTION 

                -- SE DEVUELVE EL ULTIMO REGISTRO
               -- SELECT @@IDENTITY as id;
        END TRY
        BEGIN CATCH
            -- deshace los cambios si ocurrio algun error
            ROLLBACK

            SELECT
                ERROR_NUMBER() AS ErrorNumber,
                ERROR_STATE() AS ErrorState,
                ERROR_SEVERITY() AS ErrorSeverity,
                ERROR_PROCEDURE() AS ErrorProcedure,
                ERROR_LINE() AS ErrorLine,
                ERROR_MESSAGE() as ErrorMessagge;
        END CATCH

		IF @i_operacion = 2
        BEGIN TRY
            BEGIN TRANSACTION

                -- REALIZAMOS LA INSERCION DE DATOS A LA TABLA ROL
               update empleados set nombre=@i_nombre,telefono=@i_telefono,dpi=@i_dpi
			    where idEmpleado=@i_id;


            COMMIT TRANSACTION 

                -- SE DEVUELVE EL ULTIMO REGISTRO
               -- SELECT @@IDENTITY as id;
        END TRY
        BEGIN CATCH
            -- deshace los cambios si ocurrio algun error
            ROLLBACK

            SELECT
                ERROR_NUMBER() AS ErrorNumber,
                ERROR_STATE() AS ErrorState,
                ERROR_SEVERITY() AS ErrorSeverity,
                ERROR_PROCEDURE() AS ErrorProcedure,
                ERROR_LINE() AS ErrorLine,
                ERROR_MESSAGE() as ErrorMessagge;
        END CATCH

		IF @i_operacion = 3
        BEGIN TRY
            BEGIN TRANSACTION

                -- REALIZAMOS LA INSERCION DE DATOS A LA TABLA ROL
                update empleados set estado=0 where idEmpleado=@i_id;


            COMMIT TRANSACTION 

                -- SE DEVUELVE EL ULTIMO REGISTRO
               -- SELECT @@IDENTITY as id;
        END TRY
        BEGIN CATCH
            -- deshace los cambios si ocurrio algun error
            ROLLBACK

            SELECT
                ERROR_NUMBER() AS ErrorNumber,
                ERROR_STATE() AS ErrorState,
                ERROR_SEVERITY() AS ErrorSeverity,
                ERROR_PROCEDURE() AS ErrorProcedure,
                ERROR_LINE() AS ErrorLine,
                ERROR_MESSAGE() as ErrorMessagge;
        END CATCH

		IF @i_operacion = 4
        BEGIN TRY
            BEGIN TRANSACTION

                -- REALIZAMOS LA INSERCION DE DATOS A LA TABLA ROL
                SELECT 
				 idEmpleado as "01",
				 nombre as "02",
				 apellido as "03",
				 direccion as "04",
				 telefono as "05",
				 dpi as "06",
				 pp.puesto as "07"

				  from empleados p
				  inner join puestos pp on pp.idPuesto=p.idPuesto
				 where p.estado=1;

            COMMIT TRANSACTION 

                -- SE DEVUELVE EL ULTIMO REGISTRO
               -- SELECT @@IDENTITY as id;
        END TRY
        BEGIN CATCH
            -- deshace los cambios si ocurrio algun error
            ROLLBACK

            SELECT
                ERROR_NUMBER() AS ErrorNumber,
                ERROR_STATE() AS ErrorState,
                ERROR_SEVERITY() AS ErrorSeverity,
                ERROR_PROCEDURE() AS ErrorProcedure,
                ERROR_LINE() AS ErrorLine,
                ERROR_MESSAGE() as ErrorMessagge;
        END CATCH




		END;
GO
/****** Object:  StoredProcedure [dbo].[sp_puestos]    Script Date: 09/02/2022 23:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[dbo].[sp_puestos]
    @i_id int = null, 
	@i_puesto varchar(100) = null,
    @i_operacion int 

	
AS
DECLARE @ultimoid INT
BEGIN



		IF @i_operacion = 4
        BEGIN TRY
            BEGIN TRANSACTION

                -- REALIZAMOS LA INSERCION DE DATOS A LA TABLA ROL
                SELECT 
				 idPuesto as "ID",
				 puesto as "Puesto"

				  from puestos p
				 where p.estado=1;

            COMMIT TRANSACTION 

                -- SE DEVUELVE EL ULTIMO REGISTRO
               -- SELECT @@IDENTITY as id;
        END TRY
        BEGIN CATCH
            -- deshace los cambios si ocurrio algun error
            ROLLBACK

            SELECT
                ERROR_NUMBER() AS ErrorNumber,
                ERROR_STATE() AS ErrorState,
                ERROR_SEVERITY() AS ErrorSeverity,
                ERROR_PROCEDURE() AS ErrorProcedure,
                ERROR_LINE() AS ErrorLine,
                ERROR_MESSAGE() as ErrorMessagge;
        END CATCH

		


		END;
GO
