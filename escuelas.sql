BEGIN;

CREATE TABLE escuelas (
    PRIMARY KEY (codigo),
    codigo INTEGER GENERATED ALWAYS AS IDENTITY,
    nombre TEXT UNIQUE NOT NULL,
    fecha_creacion DATE NOT NULL
);

COMMIT;