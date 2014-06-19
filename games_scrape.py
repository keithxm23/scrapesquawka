#!/usr/bin/env python

import urllib
from bs4 import BeautifulSoup

BASE_URL = "http://s3-irl-world-cup.squawka.com/dp/ingame/"
START_NUM = 7244 #BRA-CRO First match of WC2014

NUM_MATCHES = 20

for m in range(0,NUM_MATCHES):
    urllib.urlretrieve(BASE_URL+str(m+START_NUM), './gamedata/%s.xml' % str(m+START_NUM))
    print m+START_NUM
