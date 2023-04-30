BEGIN;

CREATE TYPE estatus_asignatura AS ENUM (
    'vigente',
    'reemplazada',
    'eliminada'
);

CREATE TABLE asignaturas (
    PRIMARY KEY (codigo),
    codigo TEXT NOT NULL
        CONSTRAINT rango_codigo_valido
        CHECK (codigo SIMILAR TO '_{4}-[0-9]{5}'),
    nombre TEXT UNIQUE NOT NULL,
    unidades_credito INTEGER NOT NULL
        CONSTRAINT rango_unidades_credito_valido
        CHECK (unidades_credito > 0),
    semestre INTEGER NOT NULL
        CONSTRAINT rango_semestre_valido
        CHECK (semestre > 0),
    taxonomia TEXT NOT NULL
        CONSTRAINT rango_taxonomia_valido
        CHECK (taxonomia SIMILAR TO 'ta-[1-9]'),
    estatus estatus_asignatura NOT NULL
);

COMMIT;