CREATE USER "cb" WITH LOGIN PASSWORD 'cb@123';
CREATE SCHEMA "cb_schema";
GRANT USAGE, CREATE ON SCHEMA "cb_schema" TO "cb";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL tables IN SCHEMA "cb_schema" TO "cb";
ALTER DEFAULT privileges IN SCHEMA "cb_schema" GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON tables TO "cb";
GRANT USAGE, SELECT ON ALL sequences IN SCHEMA "cb_schema" TO "cb";
ALTER DEFAULT privileges IN SCHEMA "cb_schema" GRANT USAGE, SELECT ON sequences TO "cb";
ALTER ROLE "cb" SET search_path = "cb_schema";