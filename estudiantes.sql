BEGIN;

CREATE TYPE estatus_estudiante AS ENUM (
    'activo',
    'retirado',
    'no inscrito',
    'egresado'
);

CREATE TABLE estudiantes (
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_escuela) REFERENCES escuelas (codigo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    cedula INTEGER UNIQUE NOT NULL
        CONSTRAINT rango_cedula_valido
        CHECK (cedula > 0),
    nombre TEXT NOT NULL,
    codigo_escuela INTEGER NOT NULL,
    direccion TEXT NOT NULL,
    telefono TEXT
        CONSTRAINT telefono_valido
        CHECK (
            CASE WHEN telefono IS NOT NULL THEN telefono SIMILAR TO '0[0-9]{3}-[0-9]{7}'
                ELSE TRUE
            END
        ),
    fecha_nacimiento DATE NOT NULL,
    estatus estatus_estudiante NOT NULL
);

COMMIT;