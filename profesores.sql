BEGIN;

CREATE TABLE profesores (
    PRIMARY KEY (cedula),
    cedula cedula UNIQUE NOT NULL,
    nombre nombre NOT NULL,
    direccion TEXT NOT NULL,
    telefono telefono,
    categoria TEXT NOT NULL
        CONSTRAINT categoria_profesor_valida
        CHECK (
            categoria = 'a' OR
            categoria = 'i' OR
            categoria = 'g' OR
            categoria = 's' OR
            categoria = 't'
        ),
    dedicacion TEXT NOT NULL
        CONSTRAINT dedicacion_profesor_valida
        CHECK (
            dedicacion = 'tc' OR
            dedicacion = 'mt' OR
            dedicacion = 'tv'
        ),
    fecha_ingreso fecha NOT NULL,
    fecha_egreso fecha NOT NULL,
    estatus TEXT NOT NULL
        CONSTRAINT estatus_profesor_valido
        CHECK (
            estatus = 'a' OR
            estatus = 'r' OR
            estatus = 'p' OR
            estatus = 'j'
        ),
    CONSTRAINT fecha_ingreso_antecede_fecha_egreso
    CHECK (fecha_ingreso < fecha_egreso)
);

COMMIT;