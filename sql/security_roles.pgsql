-- Create tables: users, teams, team_states, and states
CREATE TABLE users (
    userid serial NOT NULL PRIMARY KEY,
    username text NOT NULL,
    team_id serial NOT NULL REFERENCES teams (team_id)
);

CREATE TABLE teams (
    team_id serial NOT NULL PRIMARY KEY,
    team_name text NOT NULL
);

CREATE TABLE team_states (
    team_id int NOT NULL REFERENCES teams (team_id),
    state text NOT NULL REFERENCES states (state)
);

SELECT DISTINCT
    state INTO states
FROM
    hospitals_reporting_percentage;

ALTER TABLE states
    ADD PRIMARY KEY (state);

-- Insert sample data to table: users
INSERT INTO users (username, team_id)
    VALUES ('dian', 1), ('kaitao', 2), ('alejandro', 2);

-- Insert sample data to table: teams, team_states
WITH newteam AS (
INSERT INTO teams (team_name)
        VALUES ('pacnw')
    RETURNING
        team_id)
    INSERT INTO team_states (team_id, state)
    SELECT
        team_id,
        tstate
    FROM
        newteam
    CROSS JOIN (
        VALUES ('WA'),
            ('OR'),
            ('ID')) v (tstate);

WITH newteam AS (
INSERT INTO teams (team_name)
        VALUES ('midwest')
    RETURNING
        team_id)
    INSERT INTO team_states (team_id, state)
    SELECT
        team_id,
        tstate
    FROM
        newteam
    CROSS JOIN (
        VALUES ('MI'),
            ('OH'),
            ('IL'),
            ('IN')) v (tstate);

-- Test
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

