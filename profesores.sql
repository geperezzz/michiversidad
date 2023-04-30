BEGIN;

CREATE TYPE categoria_profesor AS ENUM (
    'asistente',
    'instructor',
    'agregado',
    'asociado',
    'titular'
);

CREATE TYPE dedicacion_profesor AS ENUM (
    'tiempo completo',
    'medio tiempo',
    'tiempo convencional'
);

CREATE TYPE estatus_profesor AS ENUM (
    'activo',
    'retirado',
    'de permiso',
    'jubilado'
);

CREATE TABLE profesores (
    PRIMARY KEY (cedula),
    cedula INTEGER NOT NULL
        CONSTRAINT rango_cedula_valido
        CHECK (cedula >= 0),
    nombre TEXT NOT NULL,
    direccion TEXT NOT NULL,
    numero_telefono TEXT
        CONSTRAINT numero_telefono_valido
        CHECK (
            CASE WHEN numero_telefono IS NOT NULL THEN numero_telefono SIMILAR TO '0[0-9]{3}-[0-9]{7}'
                ELSE TRUE
            END
        ),
    categoria categoria_profesor NOT NULL,
    dedicacion dedicacion_profesor NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_egreso DATE,
    estatus estatus_profesor NOT NULL,
    CONSTRAINT fecha_ingreso_antecede_fecha_egreso
    CHECK (
        CASE WHEN fecha_egreso IS NOT NULL THEN fecha_ingreso < fecha_egreso
            ELSE TRUE
        END
    )
);

COMMIT;