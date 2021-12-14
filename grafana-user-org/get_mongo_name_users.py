from json import dumps as json_dumps
import sys
import get_mongo_users

if __name__ == "__main__":
    # get arguments
    mongo_connection_string = sys.argv[1]
    project = sys.argv[2]
    # get users
    users = get_mongo_users.get_users(mongo_connection_string=mongo_connection_string, project=project)

    # generate json with names
    names = []
    for user in users:
        names.append(user['name'])
    # print json
    out = dict(names=','.join(names))
    print(json_dumps(out))
