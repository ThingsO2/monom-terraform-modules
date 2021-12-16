from json import dumps as json_dumps
import sys
import get_mongo_users

if __name__ == "__main__":
    # get arguments
    mongo_connection_string = sys.argv[1]
    # get users
    users = get_mongo_users.get_users(mongo_connection_string=mongo_connection_string)
    # generate json with logins
    logins = []
    for user in users:
        logins.append(user['_id']['$oid'])
    # print json
    out = dict(logins=','.join(logins))
    print(json_dumps(out))
