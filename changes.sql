BEGIN;

ALTER TABLE estudiantes
    DROP CONSTRAINT estatus_estudiante_valido,
    DROP COLUMN codigo_escuela;

ALTER TABLE pagos
    ADD CONSTRAINT rango_monto_valido
    CHECK (monto > 0);

ALTER TABLE estudiantes
    ALTER COLUMN direccion DROP NOT NULL,
    ADD CONSTRAINT estatus_estudiante_valido
        CHECK (
            estatus = 'activo' OR
            estatus = 'retirado' OR
            estatus = 'no inscrito' OR
            estatus = 'egresado'
        ),
    ADD COLUMN codigo_escuela INTEGER NOT NULL REFERENCES escuelas (codigo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;

COMMIT;