BEGIN;

CREATE TABLE secciones (
    PRIMARY KEY (nrc),
    FOREIGN KEY (codigo_asignatura) REFERENCES asignaturas (codigo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (cedula_profesor) REFERENCES profesores (cedula)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    nrc INTEGER NOT NULL
        CONSTRAINT rango_nrc_valido
        CHECK (nrc > 0),
    codigo_asignatura TEXT NOT NULL,
    lapso TEXT NOT NULL
        CONSTRAINT lapso_valido
        CHECK (lapso SIMILAR TO '[0-9]{4}(15|25)'),
    cedula_profesor INTEGER NOT NULL
);

CREATE INDEX indice_secciones_por_codigo_asignatura_lapso_cedula_profesor ON secciones (codigo_asignatura, lapso, cedula_profesor);

COMMIT;