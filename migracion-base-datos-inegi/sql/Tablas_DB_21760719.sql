-- Creación de la tabla Municipios
CREATE TABLE Municipios (
    id_municipio INT PRIMARY KEY,
    municipio VARCHAR(100) NOT NULL
);

-- Creación de la tabla Actividades
CREATE TABLE Actividades (
    id_codigo_act INT PRIMARY KEY,
    nombre_act VARCHAR(100) NOT NULL
);

-- Creación de la tabla Contactos
CREATE TABLE Contactos (
    id_contacto INT PRIMARY KEY,
    telefono VARCHAR(15),
    tipoUniEco VARCHAR(50),
    correoelec VARCHAR(100),
    www VARCHAR(100)
);


-- Creación de la tabla Ubicaciones
CREATE TABLE Ubicaciones (
    id_ubicacion INT PRIMARY KEY,
    id_municipio INT,
    localidad VARCHAR(100),
    tipo_vial VARCHAR(50),
    nom_vial VARCHAR(100),
    cod_postal VARCHAR(10),
    ageb VARCHAR(50),
    manzana VARCHAR(50),
    latitud DECIMAL(9,6),
    longitud DECIMAL(9,6),
    FOREIGN KEY (id_municipio) REFERENCES Municipios(id_municipio)
);

-- Creación de la tabla principal (Establecimientos)
CREATE TABLE Establecimientos (
    id INT PRIMARY KEY,
    nom_estab VARCHAR(100) NOT NULL,
    id_codigo_act INT,
    raz_social VARCHAR(100),
    id_ubicacion INT,
    id_contacto INT,
    per_ocu VARCHAR(50), 
    fecha_alta DATE,
    FOREIGN KEY (id_codigo_act) REFERENCES Actividades(id_codigo_act),
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicaciones(id_ubicacion),
    FOREIGN KEY (id_contacto) REFERENCES Contactos(id_contacto)
);
