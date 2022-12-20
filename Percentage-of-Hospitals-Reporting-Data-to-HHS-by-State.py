from src.io import read_data_from_url

records = read_data_from_url(url="https://healthdata.gov/resource/8xss-g7j8.json")
values = ", ".join([f"{tuple(r.values())}" for r in records])
# print(records)

## method 1
inject_query = f"""INSERT INTO
hospitals_reporting_percentage(state, reported, total, percentage_reporting)
VALUES
    {values}
returning *;"""
# print(inject_query)

## method 2
import psycopg2
from psycopg2.extras import Json

conn = psycopg2.connect(
    user="postgres",
    password="123456",
    host="localhost",
    port="5432",
    database="healthdata",
)

cursor = conn.cursor()

cursor.execute(inject_query)
# print(cursor.fetchone())
conn.commit()

cursor.close()
conn.close()
