# Base de datos para aplicación de Streaming

## 📌 Documentación para la Planificación del Proyecto de Base de Datos

Este documento describe la base de datos para la aplicación de streaming de películas. Contiene información sobre el proyecto, la estructura de las tablas, diagramas de la base de datos, scripts de creación y documentación para su uso.

---

## 1.- Información del Proyecto

**📌 Nombre del Proyecto:** `Streaming_8A`  

**📖 Descripción:** Base de datos para gestionar el contenido de una plataforma de streaming de películas. Permitirá almacenar información sobre películas, usuarios, reproducciones y más.  

**🎯 Objetivo:** Proveer una estructura eficiente para almacenar y gestionar datos relacionados con el catálogo de películas y el comportamiento de los usuarios dentro de la plataforma.

---

## 2.- Tablas

_A continuación, se presenta la estructura de las tablas. Esta se irá completando con el desarrollo del proyecto._

- **`Usuarios`**: Almacena información sobre los usuarios de la plataforma.
- **`Peliculas`**: Contiene datos sobre las películas disponibles en la aplicación.
- **`Series`**: Contiene datos sobre las series disponibles en la aplicación.
- **`Reseñas`**: Almacena información sobre las reseñas hechas por los usuarios de las peliculas y series.
- **`Historial_visualizacion`**: Registra el historial de las peliculas y series de los usuarios.

---

## 3.- Script de Creación de la Base de Datos

_A continuación, se proporcionará el script para la creación de la base de datos una vez que la estructura de las tablas esté definida._

```sql
-- Crear base de datos
CREATE DATABASE Streaming_8A;
USE Streaming_8A;

```

---

## 4.- Documentación para Uso de la Base de Datos

Se proporcionará información sobre:

- 📌 **Consultas comunes** (ejemplo: obtener todas las películas de una categoría, listar los usuarios con más reproducciones, etc.).
- 📌 **Procedimientos almacenados** para optimizar operaciones.
- 📌 **Vistas** para simplificar consultas frecuentes.
- 📌 **Mantenimiento de la base de datos** (copias de seguridad, optimización de índices, etc.).

---

Este `README.md` servirá como referencia para el desarrollo y mantenimiento de la base de datos del sistema de streaming de películas. 🎬📀


