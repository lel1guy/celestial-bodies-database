# Celestial Bodies Database

**freeCodeCamp Relational Database Certification** — Project #1

A PostgreSQL relational database modeling celestial bodies from galaxy types down to moons. Demonstrates multi-table schema design with a 5-level foreign key chain, real astronomical data, and custom data types.

---

## Features

- **5-table hierarchy** — galaxy_type -> galaxy -> star -> planet -> moon
- **Foreign key chain** — each table references its parent, enforcing referential integrity
- **Real astronomical data** — populated with actual galaxies (Milky Way, Andromeda), stars (Sun, Sirius, Betelgeuse), planets (8 solar system + 5 exoplanets), and 24 moons
- **Custom types** — galaxy classification (Spiral, Elliptical, Irregular, Barred Spiral, Lenticular)
- **Diverse column types** — SERIAL, VARCHAR, INT, NUMERIC, BOOLEAN, TEXT with NOT NULL and UNIQUE constraints

## Technologies

| Tech | Purpose |
|------|---------|
| PostgreSQL | Relational database (5 tables) |
| SQL | DDL, DML, constraints, foreign keys, sequences |

## Database Schema

```
universe
+-- galaxy_type
|   +-- galaxy_type_id  SERIAL PRIMARY KEY
|   +-- name            VARCHAR UNIQUE NOT NULL
|   +-- is_spherical    BOOLEAN NOT NULL
|   +-- mass            NUMERIC
|
+-- galaxy
|   +-- galaxy_id           SERIAL PRIMARY KEY
|   +-- name                VARCHAR UNIQUE NOT NULL
|   +-- galaxy_type_id      INT -> galaxy_type(galaxy_type_id)
|   +-- size_light_years    NUMERIC
|   +-- has_supermassive_bh BOOLEAN NOT NULL
|   +-- description         TEXT
|
+-- star
|   +-- star_id     SERIAL PRIMARY KEY
|   +-- name        VARCHAR UNIQUE NOT NULL
|   +-- galaxy_id   INT NOT NULL -> galaxy(galaxy_id)
|   +-- mass_solar  INT
|   +-- is_binary   BOOLEAN NOT NULL
|
+-- planet
|   +-- planet_id           SERIAL PRIMARY KEY
|   +-- name                VARCHAR UNIQUE NOT NULL
|   +-- star_id             INT NOT NULL -> star(star_id)
|   +-- radius_km           INT
|   +-- has_rings           BOOLEAN NOT NULL
|   +-- orbital_period_days NUMERIC
|   +-- description         TEXT
|
+-- moon
    +-- moon_id              SERIAL PRIMARY KEY
    +-- name                 VARCHAR UNIQUE NOT NULL
    +-- planet_id            INT NOT NULL -> planet(planet_id)
    +-- radius_km            INT
    +-- is_spherical         BOOLEAN NOT NULL
    +-- surface_pressure_pa  NUMERIC
    +-- discovered_year      INT
```

## How to Run

```bash
# 1. Load the database (creates universe DB, schema, and data)
psql -U postgres -f universe.sql

# 2. Verify
psql -U postgres -d universe -c "SELECT COUNT(*) AS galaxies FROM galaxy;"
psql -U postgres -d universe -c "SELECT COUNT(*) AS moons FROM moon;"
```

## Files

| File | Description |
|------|-------------|
| universe.sql | PostgreSQL dump (schema + real astronomical data) |
| README.md | This file |

## Certification

This project is part of freeCodeCamp's **Relational Database Certification**.
