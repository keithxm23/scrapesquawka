import json
import os

for subdir, dirs, files in os.walk('./playerdata/'):
    for fil in files:
        print subdir+fil
        with open(subdir+fil) as f:
            data = json.loads(f.read())
            for player in data[3]:
                print player
                #TODO now feed this data in to a db
