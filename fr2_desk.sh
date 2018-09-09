#
# Created by ichigoi7e on 17/07/2018.
#

#!/bin/bash

# Run test
./bin/rgbd_tum Vocabulary/ORBvoc.bin test/TUM2.yaml Dataset/rgbd_dataset_freiburg2_desk test/associations/fr2_desk.txt
# Convert *.pcd to *.ot
./tools/pcd2octomap map.pcd map.ot
# Plot ATE image
./tools/evaluate_ate.py Dataset/rgbd_dataset_freiburg2_desk/groundtruth.txt CameraTrajectory.txt --plot result.png
# Print all evaluation data
./tools/evaluate_ate.py Dataset/rgbd_dataset_freiburg2_desk/groundtruth.txt CameraTrajectory.txt --verbose
