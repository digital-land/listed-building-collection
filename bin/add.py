#!/usr/bin/env python3

import csv
from decimal import Decimal

n = Decimal(31479320)

w = csv.DictWriter(open("x", "w", newline=""), ["pipeline", "resource", "row-number", "organisation", "value", "entity"], extrasaction="ignore")
w.writeheader()

for row in csv.DictReader(open("pipeline/lookup.csv")):
    if not row.get("entity", ""):
        row["entity"] = n
        n = n + 1

    w.writerow(row)

