CREATE USER "notary" WITH LOGIN PASSWORD 'notary@123';
CREATE SCHEMA "notary_schema";
GRANT USAGE, CREATE ON SCHEMA "notary_schema" TO "notary";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL tables IN SCHEMA "notary_schema" TO "notary";
ALTER DEFAULT privileges IN SCHEMA "notary_schema" GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON tables TO "notary";
GRANT USAGE, SELECT ON ALL sequences IN SCHEMA "notary_schema" TO "notary";
ALTER DEFAULT privileges IN SCHEMA "notary_schema" GRANT USAGE, SELECT ON sequences TO "notary";
ALTER ROLE "notary" SET search_path = "notary_schema";
