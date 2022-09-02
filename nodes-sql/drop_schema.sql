REASSIGN OWNED BY citi TO postgres;  -- or some other trusted role
DROP OWNED BY citi;

REASSIGN OWNED BY gs TO postgres;  -- or some other trusted role
DROP OWNED BY gs;

REASSIGN OWNED BY cb TO postgres;  -- or some other trusted role
DROP OWNED BY cb;

REASSIGN OWNED BY hsbc TO postgres;  -- or some other trusted role
DROP OWNED BY hsbc;

REASSIGN OWNED BY mas TO postgres;  -- or some other trusted role
DROP OWNED BY mas;

REASSIGN OWNED BY notary TO postgres;  -- or some other trusted role
DROP OWNED BY notary;

drop role if exists citi;

drop role if exists gs;

drop role if exists hsbc;

drop role if exists mas;

drop role if exists cb;

drop role if exists notary;

drop schema if exists gs_schema cascade;

drop schema if exists hsbc_schema cascade;

drop schema if exists mas_schema cascade;

drop schema if exists cb_schema cascade;

drop schema if exists notary_schema cascade;

