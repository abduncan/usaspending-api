--------------------------------------------------------
-- Created using matview_sql_generator.py             --
--    The SQL definition is stored in a json file     --
--    Look in matview_generator for the code.         --
--                                                    --
--  DO NOT DIRECTLY EDIT THIS FILE!!!                 --
--------------------------------------------------------
CREATE INDEX idx_bf26125d$319__action_date_temp ON summary_view_psc_codes_temp USING BTREE("action_date" DESC NULLS LAST) WITH (fillfactor = 100);
CREATE INDEX idx_bf26125d$319__type_temp ON summary_view_psc_codes_temp USING BTREE("type") WITH (fillfactor = 100);
CREATE INDEX idx_bf26125d$319__pulled_from_temp ON summary_view_psc_codes_temp USING BTREE("pulled_from") WITH (fillfactor = 100) WHERE "pulled_from" IS NOT NULL;
