CREATE USER "hsbc" WITH LOGIN PASSWORD 'hsbc@123';
CREATE SCHEMA "hsbc_schema";
GRANT USAGE, CREATE ON SCHEMA "hsbc_schema" TO "hsbc";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL tables IN SCHEMA "hsbc_schema" TO "hsbc";
ALTER DEFAULT privileges IN SCHEMA "hsbc_schema" GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON tables TO "hsbc";
GRANT USAGE, SELECT ON ALL sequences IN SCHEMA "hsbc_schema" TO "hsbc";
ALTER DEFAULT privileges IN SCHEMA "hsbc_schema" GRANT USAGE, SELECT ON sequences TO "hsbc";
ALTER ROLE "hsbc" SET search_path = "hsbc_schema";