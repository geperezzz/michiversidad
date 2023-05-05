BEGIN;

CREATE TABLE pagos (
    PRIMARY KEY (numero_factura),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    numero_factura INTEGER NOT NULL,
    id_estudiante INTEGER NOT NULL,
    fecha_emision fecha NOT NULL,
    tipo_pago TEXT NOT NULL
        CONSTRAINT tipo_pago_valido
        CHECK (
            tipo_pago = 't' OR
            tipo_pago = 'j' OR
            tipo_pago = 'd'
        ),
    tipo_moneda TEXT NOT NULL
        CONSTRAINT tipo_moneda_valido
        CHECK (
            tipo_moneda = 'b' OR
            tipo_moneda = 'd' OR
            tipo_moneda = 'p'
        ),
    monto NUMERIC NOT NULL
);

CREATE INDEX indice_pagos_por_id_estudiante ON pagos (id_estudiante);

COMMIT;