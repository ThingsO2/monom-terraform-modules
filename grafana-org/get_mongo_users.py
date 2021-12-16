# pip install "pymongo[srv]"
from pymongo import MongoClient
from bson.json_util import dumps
from json import loads as json_load

# function to get users from mongo
def get_users(mongo_connection_string, project, mongo_db = 'monomizer', mongo_collection = 'accounts.user'):
    # connect to mongo
    client = MongoClient(mongo_connection_string)
    # get db
    db = client[mongo_db]
    # get collection
    collection = db[mongo_collection]
    # get all users
    users = collection.find({'projects': project})
    # return users
    return json_load(dumps(users))
