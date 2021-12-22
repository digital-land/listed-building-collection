#!/usr/bin/env python3

import csv
from decimal import Decimal

e = Decimal(42100000)
n = 0
dataset = "listed-building-outline"
resource = "b9f01065469eb19645c1f00acb149289d2f050e5a6407a8fc8db199ed37c923a"

w = csv.DictWriter(open("x", "w", newline=""), ["pipeline", "resource", "row-number", "organisation", "value", "entity"], extrasaction="ignore")
w.writeheader()

for row in csv.DictReader(open("transformed/%s/%s.csv" % (dataset, resource))):
    if not row.get("entity", ""):
        row["pipeline"] = dataset
        row["resource"] = resource
        row["entity"] = e + n
        n = n + 1
        row["row-number"] = n

    w.writerow(row)

