# Base de datos para aplicación de Streaming

## 📌 Documentación para la Planificación del Proyecto de Base de Datos

Este documento describe la base de datos para la aplicación de streaming de películas. Contiene información sobre el proyecto, la estructura de las tablas, diagramas de la base de datos, scripts de creación y documentación para su uso.

---

## 1.- Información del Proyecto

**📌 Nombre del Proyecto:** `Streaming_8A`  
**📖 Descripción:** Base de datos para gestionar el contenido de una plataforma de streaming de películas. Permitirá almacenar información sobre películas, usuarios, reproducciones y más.  
**🎯 Objetivo:** Proveer una estructura eficiente para almacenar y gestionar datos relacionados con el catálogo de películas y el comportamiento de los usuarios dentro de la plataforma.

---

## 2.- Tablas 📊

_A continuación, se presenta la estructura de las tablas. Esta se irá completando con el desarrollo del proyecto._

- **`usuarios`**: Almacena información sobre los usuarios de la plataforma.
- **`peliculas`**: Contiene datos sobre las películas disponibles en la aplicación.
- **`categorias`**: Clasifica las películas por género o temática.
- **`reproducciones`**: Registra el historial de reproducciones de los usuarios.
- **`favoritos`**: Guarda la lista de películas marcadas como favoritas por los usuarios.

---

## 3.- Diagramas 🖼️

_Aquí se incluirán diagramas ERD y de relaciones entre tablas._

---

## 4.- Script de Creación de la Base de Datos 🛠️

_A continuación, se proporcionará el script para la creación de la base de datos una vez que la estructura de las tablas esté definida._

```sql
-- Crear base de datos
CREATE DATABASE Streaming_8A;
USE peliculas_database;

-- Creación de tablas

--Tabla de usuarios

CREATE TABLE Usuarios (
    usuario_ID INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ap_paterno VARCHAR(255) NOT NULL,
    ap_materno VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol BOOLEAN NOT NULL DEFAULT FALSE,
    ultima_sesion TIMESTAMP,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--Tabla de Reseñas
CREATE TABLE resenas (
    resena_id INT PRIMARY KEY,
    usuario_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario VARCHAR(50),
    fecha_resena TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario_ID ON DELETE CASCADE
);

--Tabla de historial_visualizacion
CREATE TABLE historial_visualizacion (
    historial_visualizacion_ID INT PRIMARY KEY,
    usuario_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    progreso INT CHECK (progreso BETWEEN 0 AND 100),
    fecha_visto TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario_ID ON DELETE CASCADE
)

```

---

## 5.- Documentación para Uso de la Base de Datos 📚

Se proporcionará información sobre:

- 📌 **Consultas comunes** (ejemplo: obtener todas las películas de una categoría, listar los usuarios con más reproducciones, etc.).
- 📌 **Procedimientos almacenados** para optimizar operaciones.
- 📌 **Vistas** para simplificar consultas frecuentes.
- 📌 **Mantenimiento de la base de datos** (copias de seguridad, optimización de índices, etc.).

---

## 6.- Notas Adicionales 📝

- 🔹 Se recomienda definir bien las relaciones entre las tablas antes de su implementación.
- 🔹 Se podrá agregar documentación adicional conforme avance el proyecto.

---

Este `README.md` servirá como referencia para el desarrollo y mantenimiento de la base de datos del sistema de streaming de películas. 🎬📀


