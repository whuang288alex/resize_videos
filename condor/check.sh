#!/bin/bash

# TODO: modify this part if needed
PROJECT=resize_videos
ENVNAME=resize   
INPUT_STAGING_DIR=groups/li_group_biostats
INPUT_TAR=THUMOS14_val_30fps

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
python check_videos.py -vi ./videos_resized -fps 30