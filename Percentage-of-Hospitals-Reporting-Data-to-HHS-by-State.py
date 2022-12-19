from typing import Dict, List
from urllib.request import urlopen
import json

import numpy as np


def read_data_from_url(url: str) -> Dict:
    """Read data from a url.
    Args:
        url (str): the url of data.
    Returns:
        Dict: data from the url.
    """
    try:
        response = urlopen(url)
    except:
        # "HTTP Error 500: Internal Server Error"
        print("Please check your internet connection and retry.")
        return {}

    return json.loads(response.read())


url = "https://healthdata.gov/resource/8xss-g7j8.json"
records = read_data_from_url(url)
values = ", ".join([f"{tuple(r.values())}" for r in records])

sql = f"""INSERT INTO 
hospitals_reporting_percentage(state, reported, total, percentage_reporting) 
VALUES
    {values}
;"""
print(sql)
