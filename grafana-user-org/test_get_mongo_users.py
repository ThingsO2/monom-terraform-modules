# test get_mongo_users function

import unittest
import sys

import get_mongo_users

def test_get_mongo_users():
    users = get_mongo_users.get_users('-----', '6144824e46b77634f490cc08')

    # check if users is a list
    assert isinstance(users, list)

    # check if users have almost 6144824e46b77634f490cc08 value in projects field
    for user in users:
        print(user)
        assert '6144824e46b77634f490cc08' in user['projects']

    for user in users:
        print(user)
        assert not 'invalid_project_id' in user['projects']