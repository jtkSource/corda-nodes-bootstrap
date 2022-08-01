CREATE USER "gs" WITH LOGIN PASSWORD 'gs@123';
CREATE SCHEMA "gs_schema";
GRANT USAGE, CREATE ON SCHEMA "gs_schema" TO "gs";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL tables IN SCHEMA "gs_schema" TO "gs";
ALTER DEFAULT privileges IN SCHEMA "gs_schema" GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON tables TO "gs";
GRANT USAGE, SELECT ON ALL sequences IN SCHEMA "gs_schema" TO "gs";
ALTER DEFAULT privileges IN SCHEMA "gs_schema" GRANT USAGE, SELECT ON sequences TO "gs";
ALTER ROLE "gs" SET search_path = "gs_schema";