#!/bin/bash -e

# Create postgres Database
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
create user acn_erp_manager with encrypted password 'welcome1';
create database acn_erp_manager
with owner = acn_erp_manager
encoding = 'UTF8'
tablespace = pg_default
connection limit = -1
template = template0;
grant all on database acn_erp_manager to acn_erp_manager;
grant all on database acn_erp_manager to public;
grant usage on schema public to acn_erp_manager;
grant all on schema public to acn_erp_manager;
EOSQL

# Create schema for Tables
psql -v ON_ERROR_STOP=1 --username "acn_erp_manager" <<-EOSQL
create schema acn_erp_manager;
grant all on schema acn_erp_manager to acn_erp_manager;
grant usage on schema acn_erp_manager to acn_erp_manager;
EOSQL
