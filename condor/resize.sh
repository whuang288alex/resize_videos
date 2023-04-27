#!/bin/bash

# TODO: modify this part if needed
ENVNAME=resize      
INPUT_STAGING_DIR=groups/li_group_biostats
INPUT_TAR=THUMOS14_test
INPUT_FOLDER=test
OUTPUT_STAGING_DIR=groups/li_group_biostats
OUTPUT_TAR=resized_test

# Assumptions:
# 1) code is zipped to "resize_videos.tar.gz"
set -e
export PATH
mkdir $ENVNAME
tar -xzf /staging/$INPUT_STAGING_DIR/$ENVNAME.tar.gz -C $ENVNAME
. $ENVNAME/bin/activate
tar -xzf /staging/$INPUT_STAGING_DIR/resize_videos.tar.gz
tar -xzf /staging/$INPUT_STAGING_DIR/$INPUT_TAR.tar.gz
mv $INPUT_FOLDER videos

# run the extraction
python resize_videos.py -vi ./videos -vo ./videos_resized  -s 288 -fps 30

# zip the results
rm ./*.py
tar -zcvf $OUTPUT_TAR.tar.gz ./videos_resized/*.mp4
mv $OUTPUT_TAR.tar.gz /staging/$OUTPUT_STAGING_DIR/

