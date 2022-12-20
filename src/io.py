from typing import Dict, List
from urllib.request import urlopen
import json


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
