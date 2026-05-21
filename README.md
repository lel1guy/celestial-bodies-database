# Celestial Bodies Database

A PostgreSQL relational database modeling celestial bodies — from galaxy types down to moons — built as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/).

## Technologies

- **PostgreSQL 12**
- SQL (DDL, DML, constraints, foreign keys, sequences)

## Database Schema

The database contains **5 tables** with hierarchical relationships representing the structure of the universe:

```
galaxy_type
    │
    ▼
galaxy ──► star ──► planet ──► moon
```

### Tables

#### `galaxy_type`
Classification of galaxies (Spiral, Elliptical, Irregular, Barred Spiral, Lenticular).

| Column              | Type      | Constraints        |
|---------------------|-----------|--------------------|
| galaxy_type_id      | INT       | PK, SERIAL         |
| name                | VARCHAR   | NOT NULL, UNIQUE   |
| is_spherical        | BOOLEAN   | NOT NULL           |
| mass                | NUMERIC   |                    |

#### `galaxy`
Individual galaxies with their type, size, and properties.

| Column              | Type      | Constraints              |
|---------------------|-----------|--------------------------|
| galaxy_id           | INT       | PK, SERIAL               |
| name                | VARCHAR   | NOT NULL, UNIQUE         |
| galaxy_type_id      | INT       | FK → galaxy_type         |
| size_light_years    | NUMERIC   |                          |
| has_supermassive_bh | BOOLEAN   | NOT NULL                 |
| description         | TEXT      |                          |

#### `star`
Stars within galaxies.

| Column        | Type    | Constraints              |
|---------------|---------|--------------------------|
| star_id       | INT     | PK, SERIAL               |
| name          | VARCHAR | NOT NULL, UNIQUE         |
| galaxy_id     | INT     | NOT NULL, FK → galaxy    |
| mass_solar    | INT     |                          |
| is_binary     | BOOLEAN | NOT NULL                 |

#### `planet`
Planets orbiting stars, including exoplanets.

| Column                | Type    | Constraints              |
|-----------------------|---------|--------------------------|
| planet_id             | INT     | PK, SERIAL               |
| name                  | VARCHAR | NOT NULL, UNIQUE         |
| star_id               | INT     | NOT NULL, FK → star      |
| radius_km             | INT     |                          |
| has_rings             | BOOLEAN | NOT NULL                 |
| orbital_period_days   | NUMERIC |                          |
| description           | TEXT    |                          |

#### `moon`
Natural satellites orbiting planets.

| Column                | Type    | Constraints              |
|-----------------------|---------|--------------------------|
| moon_id               | INT     | PK, SERIAL               |
| name                  | VARCHAR | NOT NULL, UNIQUE         |
| planet_id             | INT     | NOT NULL, FK → planet    |
| radius_km             | INT     |                          |
| is_spherical          | BOOLEAN | NOT NULL                 |
| surface_pressure_pa   | NUMERIC |                          |
| discovered_year       | INT     |                          |

## Data

The database is populated with real astronomical data:

- **5** galaxy types
- **8** galaxies (Milky Way, Andromeda, Triangulum, etc.)
- **8** stars (Sun, Proxima Centauri, Sirius, Betelgeuse, etc.)
- **13** planets (8 solar system planets + 5 exoplanets)
- **24** moons (Earth's Moon, Galilean moons, Titan, Triton, etc.)

## Setup

### Prerequisites

- PostgreSQL installed and running

### Load the Database

```bash
# Run the SQL dump file to create and populate the database
psql -U postgres -f universe.sql
```

Or connect to PostgreSQL and run:

```sql
\i universe.sql
```

### Verify

```bash
psql -U postgres -d universe -c "SELECT * FROM galaxy;"
```

## Project Structure

```
celestial-bodies-database/
├── README.md           # Project documentation
└── universe.sql        # Complete database dump (schema + data)
```

## License

This project was created as part of the freeCodeCamp Relational Database Certification.
