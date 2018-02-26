--------------------------------------------------------
-- Created using matview_sql_generator.py             --
--    The SQL definition is stored in a json file     --
--    Look in matview_generator for the code.         --
--                                                    --
--  DO NOT DIRECTLY EDIT THIS FILE!!!                 --
--------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS summary_view_psc_codes_temp CASCADE;
DROP MATERIALIZED VIEW IF EXISTS summary_view_psc_codes_old CASCADE;

CREATE MATERIALIZED VIEW summary_view_psc_codes_temp AS
SELECT
  "transaction_normalized"."action_date",
  "transaction_normalized"."fiscal_year",
  "transaction_normalized"."type",
  "transaction_fpds"."pulled_from",
  "transaction_fpds"."product_or_service_code",
  SUM(COALESCE("transaction_normalized"."federal_action_obligation", 0))::NUMERIC(20, 2) AS "federal_action_obligation",
  0::NUMERIC(20, 2) AS "original_loan_subsidy_cost",
  COUNT(*) counts
FROM
  "transaction_normalized"
INNER JOIN
  "transaction_fpds" ON ("transaction_normalized"."id" = "transaction_fpds"."transaction_id")
WHERE
  "transaction_normalized".action_date >= '2007-10-01'
GROUP BY
  "transaction_normalized"."action_date",
  "transaction_normalized"."fiscal_year",
  "transaction_normalized"."type",
  "transaction_fpds"."pulled_from",
  "transaction_fpds"."product_or_service_code";

CREATE INDEX idx_bf26125d$319__action_date_temp ON summary_view_psc_codes_temp USING BTREE("action_date" DESC NULLS LAST) WITH (fillfactor = 100);
CREATE INDEX idx_bf26125d$319__type_temp ON summary_view_psc_codes_temp USING BTREE("type") WITH (fillfactor = 100);
CREATE INDEX idx_bf26125d$319__pulled_from_temp ON summary_view_psc_codes_temp USING BTREE("pulled_from") WITH (fillfactor = 100) WHERE "pulled_from" IS NOT NULL;

ALTER MATERIALIZED VIEW IF EXISTS summary_view_psc_codes RENAME TO summary_view_psc_codes_old;
ALTER INDEX IF EXISTS idx_bf26125d$319__action_date RENAME TO idx_bf26125d$319__action_date_old;
ALTER INDEX IF EXISTS idx_bf26125d$319__type RENAME TO idx_bf26125d$319__type_old;
ALTER INDEX IF EXISTS idx_bf26125d$319__pulled_from RENAME TO idx_bf26125d$319__pulled_from_old;

ALTER MATERIALIZED VIEW summary_view_psc_codes_temp RENAME TO summary_view_psc_codes;
ALTER INDEX idx_bf26125d$319__action_date_temp RENAME TO idx_bf26125d$319__action_date;
ALTER INDEX idx_bf26125d$319__type_temp RENAME TO idx_bf26125d$319__type;
ALTER INDEX idx_bf26125d$319__pulled_from_temp RENAME TO idx_bf26125d$319__pulled_from;

ANALYZE VERBOSE summary_view_psc_codes;
GRANT SELECT ON summary_view_psc_codes TO readonly;
