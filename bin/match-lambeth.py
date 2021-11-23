#!/usr/bin/env python3

import sys
import csv
from shapely.geometry import Point, Polygon
import shapely.wkt
import requests

resource = "72337bced0ee7e6f7ec339822e3ec1a55dbd02729a1df3747308ebdd49905868"
entities = {}


url = 'https://raw.githubusercontent.com/digital-land/boundary-collection/master/collection/local-authority/E09000022/index.geojson'
j = requests.get(url).json()
boundary = Polygon(j['features'][0]['geometry']['coordinates'][0])

for row in csv.DictReader(open("dataset/listed-building.csv")):
    point = shapely.wkt.loads(row["point"])
    if point.within(boundary):
        entities[row["entity"]] = point

# pipeline,resource,organisation,value,entity

for row in csv.DictReader(open("transformed/listed-building/%s.csv" % (resource))):
    found = ""
    for entity, point in entities.items():
        polygon = shapely.wkt.loads(row["geometry"])
        if point.within(polygon):
            found = entity
            break

    print("listed-building,%s,,%s,%s" % (resource, row["listed-building"], found))
    sys.stdout.flush()
