from robot.api.deco import keyword
import requests


@keyword("Concatenate")
def concatenate_two_values(value1, value2):
    return value1 + " " + value2


@keyword("Get Token")
def create_refresh_token():
    url = 'https://demo.spreecommerce.org/spree_oauth/token'
    hed = {'Content-Type': 'application/json'}
    data = {'grant_type': 'password', 'username': 'prangya@spree.com', 'password': 'Welcome@123'}
    response = requests.post(url, json=data, headers=hed)
    print(response.json())
    return response.json()

