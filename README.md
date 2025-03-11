# Migración de Base de Datos - INEGI

Este repositorio contiene una muestra de la base de datos normalizada del proyecto de migración de datos desde un archivo Excel a un servidor SQL. En este repositorio se encuentran los archivos necesarios para replicar el proceso de migración, incluyendo el archivo de muestra, el script SQL final y una explicación detallada de los pasos seguidos en la migración de los datos.

El objetivo principal de este proyecto fue transformar una base de datos grande en un formato estructurado y accesible, que facilita su manejo y consultas dentro de un servidor SQL. Para ello, se siguieron una serie de pasos, desde la normalización de los datos hasta su carga final en el servidor.

---

## Contenido del Repositorio

Este repositorio incluye los siguientes archivos:

- **muestra_datos.csv**: Una muestra de 1,000 registros de la base de datos original en formato CSV.
- **Tablas_DB_21760719.sql**: Un script SQL que crea las tablas normalizadas en el servidor y establece las relaciones entre ellas.
- **README.md**: Documentación de los pasos seguidos para migrar los datos y solucionar problemas durante el proceso.

---

## Método para Migrar los Datos al Servidor

A continuación se describe el proceso seguido para migrar los datos desde el archivo Excel original (con 138,123 registros) hacia un servidor SQL. Para facilitar la comprensión, se explican los pasos de manera detallada.

### 1. **Normalización de los Datos**

El primer paso fue realizar una normalización de los datos. La base de datos original contenía múltiples columnas con información redundante, lo que dificultaba la consulta eficiente de la misma. Por lo tanto, se dividió la información en varias tablas relacionadas entre sí.

El proceso de normalización incluyó las siguientes tablas:

- **Establecimientos**: Información sobre los negocios o establecimientos.
- **Ubicaciones**: Información de las ubicaciones de los establecimientos.
- **Contactos**: Información de contacto relacionada con cada establecimiento.
- **Actividades**: Descripción de las actividades realizadas por los establecimientos.
- **Municipios**: Información de los municipios donde se encuentran los establecimientos.

Cada tabla fue estructurada de manera que se minimizara la redundancia de datos, y las relaciones entre las tablas se definieron mediante claves foráneas. Al final, una muestra de 1,000 registros de la base de datos fue extraída y convertida a formato CSV para su carga en el servidor. Este archivo de muestra es el que se sube al repositorio.

### 2. **Conversión del Archivo Excel a CSV**

El archivo original de Excel fue convertido a formato CSV para facilitar su manejo dentro del entorno de base de datos. El formato CSV es ampliamente compatible con herramientas de bases de datos y permite una importación eficiente de los datos. 

Para convertir el archivo Excel a CSV, se utilizó la funcionalidad de exportación de Excel, guardando el archivo como CSV para cada una de las tablas. Esto hizo posible el uso de estos archivos en el siguiente paso, que es la carga de datos en el servidor SQL.

### 3. **Creación de las Tablas SQL**

Una vez que los datos fueron normalizados y convertidos a CSV, el siguiente paso fue crear las tablas en el servidor SQL. Para ello, se generó un script SQL (`Tablas_DB_21760719.sql`) que contiene las instrucciones necesarias para crear las tablas en el servidor.

El script SQL contiene:

- **Definiciones de tablas**: Instrucciones para crear las tablas con las columnas adecuadas.
- **Relaciones entre las tablas**: Uso de claves foráneas para definir las relaciones entre las distintas tablas (por ejemplo, cada establecimiento tiene una ubicación, y cada ubicación pertenece a un municipio).
  
El script está estructurado de manera que permite ejecutar una sola vez el archivo en el servidor para crear toda la estructura de la base de datos.

### 4. **Carga de los Datos en el Servidor**

Una vez que las tablas fueron creadas, el siguiente paso fue cargar los datos de los archivos CSV en el servidor. Para ello, se utilizó la instrucción `LOAD DATA INFILE` de MySQL. Esta instrucción permite importar de manera eficiente los datos desde un archivo CSV directamente a una tabla en la base de datos.

El comando utilizado es el siguiente:

```sql
LOAD DATA INFILE 'ruta/del/archivo/muestra_datos.csv'
INTO TABLE nombre_tabla
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
