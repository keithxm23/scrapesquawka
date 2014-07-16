#!/usr/bin/env python

import urllib
import os
from bs4 import BeautifulSoup

PHOTO_BASE_URL = "http://www.squawka.com/wp-content/themes/squawka_web/uploaded_icons/players/thumb/"
BASE_URL = "http://www.squawka.com/wp-content/themes/squawka_web/stats_process.php?season_id=119&team_id="
TOTAL_TEAMS = 32

found_teams = 0
team_id = 0
while(True):
    file_name = "./players_data/%s.xml" % str(team_id)
    urllib.urlretrieve(BASE_URL+str(team_id), file_name) 
    if os.path.getsize(file_name) < 1000:
        os.remove(file_name)
    else:
        found_teams+=1
        print file_name
    team_id+=1

    if found_teams == 32: break


