BEGIN;

CREATE TYPE tipo_pago AS ENUM (
    'transferencia',
    'tarjeta de credito',
    'tarjeta de debito'
);

CREATE TYPE tipo_moneda AS ENUM (
    'bolivares',
    'divisas',
    'petro'
);

CREATE TABLE pagos (
    PRIMARY KEY (numero_factura),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    numero_factura INTEGER NOT NULL,
    id_estudiante INTEGER NOT NULL,
    fecha_emision DATE NOT NULL,
    tipo_pago tipo_pago NOT NULL,
    tipo_moneda tipo_moneda NOT NULL,
    monto INTEGER NOT NULL
        CONSTRAINT rango_monto_valido
        CHECK (monto > 0)
);

CREATE INDEX indice_pagos_por_id_estudiante ON pagos (id_estudiante);

COMMIT;