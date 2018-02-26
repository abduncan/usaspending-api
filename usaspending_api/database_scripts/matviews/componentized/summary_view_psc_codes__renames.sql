--------------------------------------------------------
-- Created using matview_sql_generator.py             --
--    The SQL definition is stored in a json file     --
--    Look in matview_generator for the code.         --
--                                                    --
--  DO NOT DIRECTLY EDIT THIS FILE!!!                 --
--------------------------------------------------------
ALTER MATERIALIZED VIEW IF EXISTS summary_view_psc_codes RENAME TO summary_view_psc_codes_old;
ALTER INDEX IF EXISTS idx_bf26125d$319__action_date RENAME TO idx_bf26125d$319__action_date_old;
ALTER INDEX IF EXISTS idx_bf26125d$319__type RENAME TO idx_bf26125d$319__type_old;
ALTER INDEX IF EXISTS idx_bf26125d$319__pulled_from RENAME TO idx_bf26125d$319__pulled_from_old;

ALTER MATERIALIZED VIEW summary_view_psc_codes_temp RENAME TO summary_view_psc_codes;
ALTER INDEX idx_bf26125d$319__action_date_temp RENAME TO idx_bf26125d$319__action_date;
ALTER INDEX idx_bf26125d$319__type_temp RENAME TO idx_bf26125d$319__type;
ALTER INDEX idx_bf26125d$319__pulled_from_temp RENAME TO idx_bf26125d$319__pulled_from;
