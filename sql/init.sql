CREATE USER wirewizard WITH PASSWORD 'ww';

CREATE DATABASE keys;

GRANT CONNECT ON DATABASE keys TO wirewizard;
GRANT ALL PRIVILEGES ON DATABASE keys TO wirewizard;
REVOKE ALL PRIVILEGES ON DATABASE keys FROM postgres;

\c keys wirewizard;

CREATE SCHEMA IF NOT EXISTS wireguard;

GRANT USAGE ON SCHEMA wireguard TO wirewizard;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA wireguard TO wirewizard;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA wireguard FROM postgres;

CREATE TABLE wireguard.servers (
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(32) UNIQUE NOT NULL,
  publicip VARCHAR(64) NOT NULL,
  subnetwork VARCHAR(64) UNIQUE NOT NULL,
  port VARCHAR(32) UNIQUE NOT NULL,
  priv_key VARCHAR(64) NOT NULL,
  pub_key VARCHAR(64) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE wireguard.clients (
  user_id SERIAL PRIMARY KEY,
  server_id INT REFERENCES wireguard.servers(user_id),
  user_name VARCHAR(32) UNIQUE NOT NULL,
  subnetwork VARCHAR(64) UNIQUE NOT NULL,
  priv_key VARCHAR(64) NOT NULL,
  pub_key VARCHAR(64) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE EXTENSION pgcrypto;

-- (heycatch) We can have multiple configs (desktop/mobile), so telegram_id without UNIQUE.
CREATE TABLE wireguard.telegram (
  user_id SERIAL PRIMARY KEY,
  client_name VARCHAR(32) REFERENCES wireguard.clients(user_name),
  telegram_id BIGINT,
  telegram_pin BYTEA,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX idx_clients_servers_id ON wireguard.clients (server_id);
CREATE INDEX idx_telegram_clients_name ON wireguard.telegram (client_name);
