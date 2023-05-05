BEGIN;

CREATE TABLE calificaciones (
    PRIMARY KEY (id_estudiante, nrc),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (nrc) REFERENCES secciones (nrc)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    id_estudiante INTEGER NOT NULL,
    nrc INTEGER NOT NULL,
    calificacion SMALLINT NOT NULL
        CONSTRAINT rango_calificacion_valido
        CHECK (calificacion BETWEEN 0 AND 20),
    estatus TEXT NOT NULL
        CONSTRAINT estatus_calificacion_valido
        CHECK (
            estatus = 'a' OR
            estatus = 'r' OR
            estatus = 'e' OR
            estatus = 'x'
        )
);

COMMIT;