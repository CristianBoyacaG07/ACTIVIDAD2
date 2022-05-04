create database Actividad2;
use Actividad2;

Create table Tratamientos (
TratamiNumero int primary key auto_increment,
TratamiFechaAsignado date not null,
TratamiDescripcion text not null,
TratamiFecahInicio date not null,
Tratami date not null,
TratamiObservaciones text not null,
TratamiPaciente char (10) not null
);

create table Pacientes (
PacienIdentificacion char (10) primary key not null,
PacienNombres varchar (50) not null,
PacienApellidos varchar (50) not null,
PacienFechaNacimiento date not null,
PacienSexo enum("M","F")
);

create table Citas (
CitaNumero int primary key auto_increment,
CitaFecha date not null,
CitaHora time not null,
CitaPaciente char (50) not null,
CitaMedico char (50) not null,
CitaConsultorio int not null,
CitaEstado  enum("Disponible","Confirmada","Cancelada"),
CitaObservaciones text not null
);

create table Medicos (
MedicIdentificacion  char (10) primary key not null,
MedicNombres varchar (50) not null,
MedicApellidos varchar (50) not null
);

create table Consultorios (
ConsuNumero int primary key not null,
ConsuNombre varchar (50) not null
);
ALTER TABLE Citas ADD CONSTRAINT fk_CitaMedico FOREIGN KEY (CitaMedico) 
REFERENCES MEDICOS (MedicIdentificacion) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Citas  ADD CONSTRAINT fk_CitaConsultorio FOREIGN KEY (CitaConsultorio) 
REFERENCES CONSULTORIOS (ConsuNumero) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Citas ADD CONSTRAINT fk_CitaPaciente FOREIGN KEY (CitaPaciente) 
REFERENCES PACIENTES (PacienIdentificacion) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Tratamientos ADD CONSTRAINT fk_TratamientoPaciente FOREIGN KEY (TratamiPaciente) 
REFERENCES PACIENTES (PacienIdentificacion) ON DELETE CASCADE ON UPDATE CASCADE;