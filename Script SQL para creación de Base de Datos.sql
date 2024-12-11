CREATE DATABASE Proyecto_Data_4;
USE Proyecto_Data_4;

CREATE TABLE historia_clinica (
id_historia BIGINT PRIMARY KEY,
enfermedades_cronicas VARCHAR(100),
alergias VARCHAR(100),
antecedentes_familiares VARCHAR(100),
cirugias_previas VARCHAR(100),
tratamientos_anteriores VARCHAR(100)
);

CREATE TABLE procedimiento (
id_procedimiento BIGINT PRIMARY KEY,
nombre_procedimiento VARCHAR(100),
descripcion_procedimiento VARCHAR(500)
);

CREATE TABLE personal_de_salud (
id_personal_salud BIGINT PRIMARY KEY,
nombre_ps VARCHAR(100),
apellidos_ps VARCHAR(100),
edad_ps TINYINT,
sexo_ps VARCHAR(50),
telefono_ps VARCHAR(50),
email_ps VARCHAR(50),
especialidad VARCHAR(50)
);

CREATE TABLE medicamento (
id_medicamento BIGINT PRIMARY KEY,
nombre_medicamento VARCHAR(100)
);

CREATE TABLE ayuda_diagnostica (
id_examen BIGINT PRIMARY KEY,
nombre_examen VARCHAR(100),
fecha_examen DATE,
resultado VARCHAR(500),
observaciones_examen VARCHAR(500)
);

CREATE TABLE departamento (
id_departamento BIGINT PRIMARY KEY,
nombre_departamento VARCHAR(100)
);

CREATE TABLE ciudad (
id_ciudad BIGINT PRIMARY KEY,
id_departamento BIGINT,
nombre_ciudad VARCHAR(100),
FOREIGN KEY (id_departamento) REFERENCES dbo.departamento(id_departamento)
);

CREATE TABLE paciente (
id_paciente BIGINT PRIMARY KEY,
id_ciudad BIGINT,
nombre_paciente VARCHAR(100),
apellidos_paciente VARCHAR(100),
fecha_nacimiento DATE,
edad_paciente TINYINT,
sexo_paciente VARCHAR(50),
direccion VARCHAR(100),
telefono_paciente VARCHAR(50),
email_paciente VARCHAR(50),
estrato TINYINT,
FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE cita_medica (
id_cita BIGINT PRIMARY KEY,
id_paciente BIGINT,
id_personal_salud BIGINT,
id_historia BIGINT,
fecha_cita DATE,
motivo_consulta VARCHAR(100),
estado_cita VARCHAR(50),
observaciones_cita VARCHAR(500),
presion_arterial NVARCHAR(100),
frecuencia_cardiaca NVARCHAR(100),
temperatura_corporal NVARCHAR(100),
saturacion_oxigeno NVARCHAR(100),
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
FOREIGN KEY (id_personal_salud) REFERENCES personal_de_salud(id_personal_salud),
FOREIGN KEY (id_historia) REFERENCES historia_clinica(id_historia)
);

CREATE TABLE diagnostico (
id_diagnostico BIGINT PRIMARY KEY,
id_examen BIGINT,
id_cita BIGINT,
nombre_diagnostico VARCHAR(100),
tratamiento_recomendado VARCHAR(100),
FOREIGN KEY (id_examen) REFERENCES ayuda_diagnostica(id_examen),
FOREIGN KEY (id_cita) REFERENCES cita_medica(id_cita)
);

CREATE TABLE medico_procedimiento (
id_medico_procedimiento BIGINT PRIMARY KEY,
id_procedimiento BIGINT,
id_personal_salud BIGINT,
fecha_procedimiento DATE,
FOREIGN KEY (id_procedimiento) REFERENCES procedimiento(id_procedimiento),
FOREIGN KEY (id_personal_salud) REFERENCES personal_de_salud(id_personal_salud)
);

CREATE TABLE formula (
id_formula BIGINT PRIMARY KEY,
id_medicamento BIGINT,
id_personal_salud BIGINT,
dosis VARCHAR(50),
frecuencia VARCHAR(50),
cantidad VARCHAR(50),
fecha_inicio DATE,
fecha_fin DATE
FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento),
FOREIGN KEY (id_personal_salud) REFERENCES personal_de_salud(id_personal_salud)
);

ALTER TABLE personal_de_salud ALTER COLUMN telefono_ps VARCHAR(50) NULL; 
ALTER TABLE personal_de_salud ALTER COLUMN email_ps VARCHAR(50) NULL;


SELECT *
FROM dbo.procedimiento;