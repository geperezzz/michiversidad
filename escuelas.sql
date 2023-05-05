BEGIN;

CREATE TABLE escuelas (
    PRIMARY KEY (codigo),
    codigo INTEGER GENERATED ALWAYS AS IDENTITY,
    nombre nombre UNIQUE NOT NULL,
    fecha_creacion fecha NOT NULL
);

COMMIT;