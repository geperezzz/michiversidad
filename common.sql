BEGIN;

CREATE DOMAIN cedula AS INTEGER
    CONSTRAINT rango_cedula_valido
    CHECK (VALUE > 0);

CREATE DOMAIN telefono AS TEXT
    CONSTRAINT telefono_valido
    CHECK (VALUE SIMILAR TO '0[0-9]{3}-[0-9]{7}');

CREATE DOMAIN nombre AS TEXT;

CREATE DOMAIN fecha AS DATE;

COMMIT;