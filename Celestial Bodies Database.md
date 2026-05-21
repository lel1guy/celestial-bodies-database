Created a Relational Database with PostgreSQL

## Schema
```
galaxy_type (5th table!)
├── galaxy_type_id (SERIAL, PK)
├── name (VARCHAR, NOT NULL, UNIQUE)
├── is_spherical (BOOLEAN, NOT NULL)
└── mass NUMERIC

galaxy
├── galaxy_id (SERIAL, PK)
├── name (VARCHAR, NOT NULL, UNIQUE)
├── galaxy_type_id (INT, FK → galaxy_type)
├── size_light_years (NUMERIC)
├── has_supermassive_bh (BOOLEAN, NOT NULL)
└── description (TEXT)

star
├── star_id (SERIAL, PK)
├── name (VARCHAR, NOT NULL, UNIQUE)
├── galaxy_id (INT, NOT NULL, FK → galaxy)
├── mass_solar (INT)
└── is_binary (BOOLEAN, NOT NULL)

planet
├── planet_id (SERIAL, PK)
├── name (VARCHAR, NOT NULL, UNIQUE)
├── star_id (INT, NOT NULL, FK → star)
├── radius_km (INT)
├── has_rings (BOOLEAN, NOT NULL)
├── orbital_period_days (NUMERIC)
└── description (TEXT)

moon
├── moon_id (SERIAL, PK)
├── name (VARCHAR, NOT NULL, UNIQUE)
├── planet_id (INT, NOT NULL, FK → planet)
├── radius_km (INT)
├── is_spherical (BOOLEAN, NOT NULL)
├── surface_pressure_pa (NUMERIC)
└── discovered_year (INT)
```




