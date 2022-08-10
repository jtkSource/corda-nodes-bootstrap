CREATE USER "citi" WITH LOGIN PASSWORD 'citi@123';
CREATE SCHEMA "citi_schema";
GRANT USAGE, CREATE ON SCHEMA "citi_schema" TO "citi";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL tables IN SCHEMA "citi_schema" TO "citi";
ALTER DEFAULT privileges IN SCHEMA "citi_schema" GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON tables TO "citi";
GRANT USAGE, SELECT ON ALL sequences IN SCHEMA "citi_schema" TO "citi";
ALTER DEFAULT privileges IN SCHEMA "citi_schema" GRANT USAGE, SELECT ON sequences TO "citi";
ALTER ROLE "citi" SET search_path = "citi_schema";