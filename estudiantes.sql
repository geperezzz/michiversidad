BEGIN;

CREATE TABLE estudiantes (
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_escuela) REFERENCES escuelas (codigo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    cedula cedula UNIQUE NOT NULL,
    nombre nombre NOT NULL,
    codigo_escuela INTEGER NOT NULL,
    direccion TEXT NOT NULL,
    telefono telefono,
    fecha_nacimiento fecha NOT NULL,
    estatus TEXT NOT NULL
        CONSTRAINT estatus_estudiante_valido
        CHECK (
            estatus = 'a' OR
            estatus = 'r' OR
            estatus = 'n' OR
            estatus = 'e'
        )
);

COMMIT;