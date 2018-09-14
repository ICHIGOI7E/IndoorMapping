# indoor_mapping
This indoor mapping system is based on [ORB-SLAM2](https://github.com/raulmur/ORB_SLAM2). Add point cloud module, you can visualize your point cloud map during the SLAM process.  We also provide some  conversion tools, such as binary dictionary and octree map (`indoor_mapping/tools/*`).
## Prerequisites
Install some necessary dependencies for system operation, we have tested in **Ubuntu 16.04**.
### CMake
[CMake](https://cmake.org/) is an open-source, cross-platform family of tools designed to build, test and package software.
```
sudo apt-get install cmake
```
### Glew
The OpenGL Extension Wrangler Library ([GLEW](http://glew.sourceforge.net/)) is a cross-platform open-source C/C++ extension loading library.
```
sudo apt-get install libglew-dev
```
### Pangolin
We use [Pangolin](https://github.com/stevenlovegrove/Pangolin) for visualization and user interface.
```
git clone https://github.com/stevenlovegrove/Pangolin.git
```
```
cd Pangolin
```
```
mkdir build && cd build
```
```
cmake ..
```
```
cmake --build .
```
### OpenCV
We use [OpenCV](https://opencv.org/) to manipulate images and features.
```
sudo apt-get install build-essential libgtk2.0-dev libvtk5-dev libjpeg-dev libtiff5-dev libjasper-dev libopenexr-dev libtbb-dev python-numpy python-matplotlib
```
```
cd opencv-3.2.0
```
```
mkdir build && cd build
```
```
cmake ..
```
```
make
```
```
sudo make install
```
### Eigen3
[Eigen](http://eigen.tuxfamily.org/) is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms.
```
sudo apt-get install libeigen3-dev
```
### g2o
We use modified version of [g2o](https://github.com/RainerKuemmerle/g2o) library to perform non-linear optimizations.
```
cd Thirdparty/g2o
```
```
mkdir build && cd build
```
```
cmake ..
```
```
make
``` 
### DBoW2
We use modified version of [DBoW2](https://github.com/dorian3d/DBoW2) library to perform place recognition.
```
cd Thirdparty/DBoW2
```
```
mkdir build && cd build
```
```
cmake ..
```
```
make
```
### Boost
[Boost](https://www.boost.org/) provides free peer-reviewed portable C++ source libraries.
```
sudo apt-get install libboost-all-dev
```
### FLANN
[FLANN](https://www.cs.ubc.ca/research/flann/) is a library for performing fast approximate nearest neighbor searches in high dimensional spaces.
```
sudo apt-get install libflann1.8 libflann-dev
```
### Qt
[Qt](https://www.qt.io/) is the faster, smarter way to create innovative devices, modern UIs & applications for multiple screens.
```
chmod +x qt-opensource-linux-x64-5.8.0.run
```
```
./qt-opensource-linux-x64-5.8.0.run
```
### VTK
The Visualization Toolkit ([VTK](https://www.vtk.org/)) is an open-source, freely available software system for 3D computer graphics, image processing, and visualization.
```
cd VTK-8.1.1
```
```
mkdir build && cd build
```
```
cmake -DVTK_QT_VERSION:STRING=5 -DQT_QMAKE_EXECUTABLE:PATH=/path/Qt5.8.0/5.8/gcc_64/bin/qmake -DVTK_Group_Qt:BOOL=ON -DCMAKE_PREFIX_PATH:PATH=/path/Qt5.8.0/5.8/gcc_64/lib/cmake -DBUILD_SHARED_LIBS:BOOL=ON ..
```
```
make
```
### PCL
The Point Cloud Library ([PCL](http://pointclouds.org/)) is a standalone, large scale, open project for 2D/3D image and point cloud processing.
```
cd pcl-pcl-1.8.1
```
```
mkdir build && cd build
```
```
cmake ..
```
```
make
```
```
sudo make install
```
### OctoMap
The [OctoMap](https://octomap.github.io/) library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++ particularly suited for robotics.
```
sudo apt-get install libqglviewer-dev-qt4
```
```
git clone https://github.com/OctoMap/octomap
```
```
cd octomap
```
```
mkdir build && cd build
```
```
cmake ..
```
```
make
```
```
sudo make install
```
### Dataset
[Computer Vision Group - Dataset Download](https://vision.in.tum.de/data/datasets/rgbd-dataset/download)
## How to install
```
git clone https://github.com/ichigoi7e/indoor_mapping.git
```
```
cd indoor_mapping
```
```
mkdir build && cd build
```
```
cmake ..
```
```
make
```
## Run examples
There are some useful manual commands, and we also provide some scripts to automate (`indoor_mapping/*.sh`).
### Run test
```
./bin/rgbd_tum Vocabulary/ORBvoc.bin test/TUM1.yaml Dataset/rgbd_dataset_freiburg1_room test/associations/fr1_room.txt
```
After this command, you can see the dense point cloud displayed in the viewer, like this:


![](https://raw.githubusercontent.com/ichigoi7e/mdpics/master/indoor_mapping/1.jpeg)
### Convert *.pcd to *.ot
```
./tools/pcd2octomap map.pcd map.ot
```
### Plot ATE image
```
./tools/evaluate_ate.py Dataset/rgbd_dataset_freiburg1_room/groundtruth.txt CameraTrajectory.txt --plot result.png
```
This command will plot the first and the aligned second trajectory to an image, like this:
![](https://raw.githubusercontent.com/ichigoi7e/mdpics/master/indoor_mapping/2.jpeg)
### Print all evaluation data
```
./tools/evaluate_ate.py Dataset/rgbd_dataset_freiburg1_room/groundtruth.txt CameraTrajectory.txt --verbose
```
## What are modified
- Add point cloud module.
- Provide binary dictionary conversion tool.
- Provide octree map conversion tool.
