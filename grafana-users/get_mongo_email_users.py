from json import dumps as json_dumps
import sys
import get_mongo_users

if __name__ == "__main__":
    # get arguments
    mongo_connection_string = sys.argv[1]
    #project = sys.argv[2]
    # get users
    users = get_mongo_users.get_users(mongo_connection_string=mongo_connection_string)

    # generate json with emails
    emails = []
    for user in users:
        emails.append(user['email'])
    # print json
    out = dict(emails=','.join(emails))
    print(json_dumps(out))
