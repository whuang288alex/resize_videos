#!/bin/bash

# TODO: modify this part if needed
PROJECT=resize_videos
ENVNAME=resize      
INPUT_STAGING_DIR=groups/li_group_biostats
INPUT_TAR=THUMOS14_val
INPUT_FOLDER=validation
OUTPUT_STAGING_DIR=groups/li_group_biostats
OUTPUT_TAR=resized_val

# Assumptions:
# 1) code is zipped to "resize_videos.tar.gz"
set -e
export PATH
mkdir $ENVNAME
tar -xzf /staging/$INPUT_STAGING_DIR/$PROJECT/$ENVNAME.tar.gz -C $ENVNAME
. $ENVNAME/bin/activate
tar -xzf /staging/$INPUT_STAGING_DIR/$PROJECT/resize_videos.tar.gz
tar -xzf /staging/$INPUT_STAGING_DIR/datasets/$INPUT_TAR.tar.gz

# run the extraction
python resize_videos.py -vi ./$INPUT_FOLDER -vo ./videos_resized  -s 288 -fps 30

# zip the results
rm ./*.py
tar -zcvf $OUTPUT_TAR.tar.gz ./videos_resized/*.mp4
mv $OUTPUT_TAR.tar.gz /staging/$OUTPUT_STAGING_DIR/

