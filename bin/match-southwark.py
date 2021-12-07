#!/usr/bin/env python3

import sys
import csv
from shapely.geometry import Point, Polygon
import shapely.wkt
import requests

entities = {}


url = 'https://raw.githubusercontent.com/digital-land/boundary-collection/master/collection/local-authority/E09000028/index.geojson'
j = requests.get(url).json()
boundary = Polygon(j['features'][0]['geometry']['coordinates'][0])

for row in csv.DictReader(open("dataset/listed-building.csv")):
    if row.get("point", ""):
        point = shapely.wkt.loads(row["point"])
        if point.within(boundary):
            entities[row["entity"]] = point

# pipeline,resource,organisation,value,entity

for resource in [
    "9d20207f8f2f674fda09b9632bd5d1495a635fcb762827b46c96522a45624bff",
    "e3a22838b44a3c1e594eee33788728a6366caef066690e5fb9fd91e46e74bac1",
    "efbdafb929921097a6e002188e281047bb4d512d40a8f88ade26cbb44118f0e3",
    ]:

    row_number = 0
    for row in csv.DictReader(open("transformed/listed-building/%s.csv" % (resource))):
        found = ""
        row_number = row_number + 1
        for entity, point in entities.items():
            try:
                polygon = shapely.wkt.loads(row["geometry"])
            except:
                print(row)
                continue
            try:
                if point.within(polygon):
                    found = entity
                    break
            except Exception as e:
                print(e, resource, row["listed-building"], file=sys.stderr)
                continue

        value = row["listed-building"]
        if str(value) == "0":
            value = ""
        n = "" if value else row_number
        print("listed-building,%s,%s,,%s,%s" % (resource, n, value, found))
        sys.stdout.flush()
