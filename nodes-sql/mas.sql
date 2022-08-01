CREATE USER "mas" WITH LOGIN PASSWORD 'mas@123';
CREATE SCHEMA "mas_schema";
GRANT USAGE, CREATE ON SCHEMA "mas_schema" TO "mas";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL tables IN SCHEMA "mas_schema" TO "mas";
ALTER DEFAULT privileges IN SCHEMA "mas_schema" GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON tables TO "mas";
GRANT USAGE, SELECT ON ALL sequences IN SCHEMA "mas_schema" TO "mas";
ALTER DEFAULT privileges IN SCHEMA "mas_schema" GRANT USAGE, SELECT ON sequences TO "mas";
ALTER ROLE "mas" SET search_path = "mas_schema";