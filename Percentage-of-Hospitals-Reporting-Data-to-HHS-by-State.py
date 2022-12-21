"""This file reads data from url, and uploads the data to 
table:hospitals_reporting_percentage.

Before running this file, the table:hospitals_reporting_percentage needs to be
created using query:
```postgresql
    CREATE TABLE IF NOT EXISTS hospitals_reporting_percentage(
        datestamp timestamptz NOT NULL DEFAULT NOW(),
        state TEXT NOT NULL,
        reported INT NOT NULL,
        total INT NOT NULL,
        percentage_reporting REAL NOT NULL
    );
```

After running this file, we can test it using query:
```postgresql
    SELECT
        *
    FROM
        hospitals_reporting_percentage
    LIMIT 1000;
```
"""

import psycopg2
from psycopg2.extras import Json

from src.io import read_data_from_url

# read data from url
records = read_data_from_url(url="https://healthdata.gov/resource/8xss-g7j8.json")
values = ", ".join([f"{tuple(r.values())}" for r in records])


# compose a query for inserting data to table:hospitals_reporting_percentage
inject_query = f"""INSERT INTO
hospitals_reporting_percentage(state, reported, total, percentage_reporting)
VALUES
    {values}
returning *;"""

# connect to database, and execute the inserting query
conn = psycopg2.connect(
    user="postgres",
    password="123456",
    host="localhost",
    port="5432",
    database="healthdata",
)
cursor = conn.cursor()
cursor.execute(inject_query)
conn.commit()
cursor.close()
conn.close()
