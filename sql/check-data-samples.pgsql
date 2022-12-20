SELECT
    *
FROM
    hospitals_reporting_percentage
LIMIT 1000;

SELECT
    count(DISTINCT state) AS nunique_states
FROM
    "hospitals_reporting_percentage"
LIMIT 1000;

