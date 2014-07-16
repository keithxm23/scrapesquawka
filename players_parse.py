import json
import os

def parse_extra_fields(extra_fields_string):
    fields = extra_fields_string.replace(":","").replace("{","").split("}")
    data = {}
    for f in fields:
        item = f.split(',')
        data[item[0]] = data[item[1]]
    return data

player_count = 0
for subdir, dirs, files in os.walk('./players_data/'):
    for fil in files:
        print subdir+fil
        with open(subdir+fil) as f:
            data = json.loads(f.read())
            for player in data[3]:
                player_count +=1
                print player, '\n'
                #TODO now feed this data in to a db
                print 'first_name', player['first_name']
                print 'last_name', player['last_name']
                print 'name', player['name']
                print 'surname', player['surname']
                """
                Commenting this out because extra_fields are not present for
                every player

                Consequently DoB, weight, height, club and shirt_num fields are
                not available for all
                #extra_fields = parse_extra_fields(player['extra_fields'])
                print 'position', player['extra_fields']
                """
                print 'position', player['position']
                print 'real_position', player['real_position']
                print 'country', player['country']
                print 'player_postype', int(player['player_postype'])
                print 'player_profile_url', player['player_profile_url']
            print '\n'

print player_count
