BEGIN;

CREATE TYPE estatus_calificacion AS ENUM (
    'aprobada',
    'reprobada',
    'equivalencia',
    'exonerada'
);

CREATE TABLE calificaciones (
    PRIMARY KEY (id_estudiante, codigo_asignatura),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (codigo_asignatura) REFERENCES asignaturas (codigo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    id_estudiante INTEGER NOT NULL,
    codigo_asignatura TEXT NOT NULL,
    calificacion INTEGER NOT NULL
        CONSTRAINT rango_calificacion_valido
        CHECK (calificacion BETWEEN 0 AND 20),
    estatus estatus_calificacion NOT NULL
);

COMMIT;