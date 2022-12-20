SELECT
    *
FROM
    hospitals_reporting_percentage
WHERE
    state IN (
        SELECT
            state
        FROM
            users
            INNER JOIN teams ON users.team_id = teams.team_id
            INNER JOIN team_states ON teams.team_id = team_states.team_id
        WHERE
            users.userid = 2);

