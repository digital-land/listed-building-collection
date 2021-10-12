LISTED_BUILDING_DATASET=$(DATASET_DIR)listed-building.csv
LISTED_BUILDING_TRANSFORMED_FILES=\
    $(TRANSFORMED_DIR)listed-building/018ca4c84ac8067646897b93e5b811573b5fe6dbe4120b635afa4b3198f3ca9e.csv\
    $(TRANSFORMED_DIR)listed-building/0ad1b811a6287d3ff6a3101fdf84b5766d020dfd4185251e40eb2057ed170659.csv\
    $(TRANSFORMED_DIR)listed-building/1694666a7c7c606facc6c48aa71f46304ce0ff3c209d284ccee874b3d9f65930.csv\
    $(TRANSFORMED_DIR)listed-building/5af0bf40fd2d02f7a842cdbdd906ce081e3cefa20b4858803b4493c57bbf1633.csv\
    $(TRANSFORMED_DIR)listed-building/8e9203bc60c1d387cc6e0e490bbb4c94f030e8a303c9d160a8c4fdbf30e9c1d2.csv\
    $(TRANSFORMED_DIR)listed-building/cec379cc7a1a380a9e8eb9405c1cce705d3bcb47021a78208ca98d1cc6394543.csv\
    $(TRANSFORMED_DIR)listed-building/d9a44a4c68c0014b510ae66fadadc79144903a35cabacd05aacd4cd7ab76eed3.csv\
    $(TRANSFORMED_DIR)listed-building/e91b0bb16528f378857762aaad27b2afd8be0cfb04fc85db57c6e57fd0bbe47c.csv\
    $(TRANSFORMED_DIR)listed-building/ebf9e1df4e638a318b6d79335c27c896c77dfcf3c2592cdb75d419f3d50362f2.csv

$(TRANSFORMED_DIR)listed-building/018ca4c84ac8067646897b93e5b811573b5fe6dbe4120b635afa4b3198f3ca9e.csv: collection/resource/018ca4c84ac8067646897b93e5b811573b5fe6dbe4120b635afa4b3198f3ca9e
	$(run-pipeline)

$(TRANSFORMED_DIR)listed-building/0ad1b811a6287d3ff6a3101fdf84b5766d020dfd4185251e40eb2057ed170659.csv: collection/resource/0ad1b811a6287d3ff6a3101fdf84b5766d020dfd4185251e40eb2057ed170659
	$(run-pipeline)

$(TRANSFORMED_DIR)listed-building/1694666a7c7c606facc6c48aa71f46304ce0ff3c209d284ccee874b3d9f65930.csv: collection/resource/1694666a7c7c606facc6c48aa71f46304ce0ff3c209d284ccee874b3d9f65930
	$(run-pipeline)

$(TRANSFORMED_DIR)listed-building/5af0bf40fd2d02f7a842cdbdd906ce081e3cefa20b4858803b4493c57bbf1633.csv: collection/resource/5af0bf40fd2d02f7a842cdbdd906ce081e3cefa20b4858803b4493c57bbf1633
	$(run-pipeline)

$(TRANSFORMED_DIR)listed-building/8e9203bc60c1d387cc6e0e490bbb4c94f030e8a303c9d160a8c4fdbf30e9c1d2.csv: collection/resource/8e9203bc60c1d387cc6e0e490bbb4c94f030e8a303c9d160a8c4fdbf30e9c1d2
	$(run-pipeline)

$(TRANSFORMED_DIR)listed-building/cec379cc7a1a380a9e8eb9405c1cce705d3bcb47021a78208ca98d1cc6394543.csv: collection/resource/cec379cc7a1a380a9e8eb9405c1cce705d3bcb47021a78208ca98d1cc6394543
	$(run-pipeline)

$(TRANSFORMED_DIR)listed-building/d9a44a4c68c0014b510ae66fadadc79144903a35cabacd05aacd4cd7ab76eed3.csv: collection/resource/d9a44a4c68c0014b510ae66fadadc79144903a35cabacd05aacd4cd7ab76eed3
	$(run-pipeline)

$(TRANSFORMED_DIR)listed-building/e91b0bb16528f378857762aaad27b2afd8be0cfb04fc85db57c6e57fd0bbe47c.csv: collection/resource/e91b0bb16528f378857762aaad27b2afd8be0cfb04fc85db57c6e57fd0bbe47c
	$(run-pipeline)

$(TRANSFORMED_DIR)listed-building/ebf9e1df4e638a318b6d79335c27c896c77dfcf3c2592cdb75d419f3d50362f2.csv: collection/resource/ebf9e1df4e638a318b6d79335c27c896c77dfcf3c2592cdb75d419f3d50362f2
	$(run-pipeline)

$(LISTED_BUILDING_DATASET): $(LISTED_BUILDING_TRANSFORMED_FILES)
	$(build-dataset)

transformed:: $(LISTED_BUILDING_TRANSFORMED_FILES)

dataset:: $(LISTED_BUILDING_DATASET)


LISTED_BUILDING_GRADE_DATASET=$(DATASET_DIR)listed-building-grade.csv
LISTED_BUILDING_GRADE_TRANSFORMED_FILES=\
    $(TRANSFORMED_DIR)listed-building-grade/474c4417dafdaa069449bb62980202f8b83ebeaa5eea2c6e689bed214ffcd2e9.csv

$(TRANSFORMED_DIR)listed-building-grade/474c4417dafdaa069449bb62980202f8b83ebeaa5eea2c6e689bed214ffcd2e9.csv: collection/resource/474c4417dafdaa069449bb62980202f8b83ebeaa5eea2c6e689bed214ffcd2e9
	$(run-pipeline)

$(LISTED_BUILDING_GRADE_DATASET): $(LISTED_BUILDING_GRADE_TRANSFORMED_FILES)
	$(build-dataset)

transformed:: $(LISTED_BUILDING_GRADE_TRANSFORMED_FILES)

dataset:: $(LISTED_BUILDING_GRADE_DATASET)
