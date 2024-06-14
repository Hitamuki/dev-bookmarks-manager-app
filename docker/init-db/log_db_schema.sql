\connect log_db;

CREATE TABLE logs (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    log_level VARCHAR(10) NOT NULL,
    message TEXT NOT NULL
);
