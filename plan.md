- read data from url (concurrency?)

- save
    - schema (use the old one)
    - additional column for (security, datestamp: defult build-in function)
        - datestamp
    
- security
    - team can belongs to different states
    - 1. postgres role
        - for writing
        - for reading (where state in (select state from (...) tmp))
    - 2. table: users (join: more work involved) 
        // datestamp, 
        userid, uuid, when multiple sources adding to the table, no worry the max value.
        username, text
        team_id, int

create table users (userid serial not null primary key, username text not null, team_id serial not null references teams (team_id));

insert into users (username, team_id) values ('dian', 1), ('kaitao', 2), ('alejandro', 2);

    - 3. table: teams
        team_id, int, unique, not null
        team_name, text
        // states, text[] // duplicates, invalid, empty

create table teams (team_id serial not null primary key, team_name text not null);
alter table states add primary key (state);

with newteam as (insert into teams (team_name) values ('pacnw') returning team_id)
insert into team_states (team_id, state) select team_id, tstate
from newteam
cross join (values ('WA'), ('OR'), ('ID')) v (tstate);

with newteam as (insert into teams (team_name) values ('midwest') returning team_id)
insert into team_states (team_id, state) select team_id, tstate
from newteam
cross join (values ('MI'), ('OH'), ('IL'), ('IN')) v (tstate);

    - 4. table: team_states, repreents the teams have access to certain states
        - team_id, int
        - state, foreigen key

create table team_states (team_id int not null references teams (team_id), state text not null references states (state));

    - 5. table: states
        - state, text, primary key

        SELECT DISTINCT state INTO states FROM hospitals_reporting_percentage;





- testing (e.g., my state should not see other states)

- schedule weekly running