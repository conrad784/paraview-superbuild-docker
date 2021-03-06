#!/bin/bash

set -e

readonly paraview_version="v5.6.0"

cd /home/paraview
git clone --recursive --branch "$paraview_version" --depth 1 https://gitlab.kitware.com/paraview/paraview-superbuild.git

mkdir -p /home/paraview/build
cd /home/paraview/build

cmake \
    "--no-warn-unused-cli" \
    "-DCTEST_USE_LAUNCHERS:BOOL=1" \
    "-DENABLE_vistrails:BOOL=ON" \
    "-DUSE_SYSTEM_qt5:BOOL=ON" \
    "-DENABLE_netcdf:BOOL=ON" \
    "-DENABLE_paraviewgettingstartedguide:BOOL=ON" \
    "-DENABLE_visitbridge:BOOL=ON" \
    "-DENABLE_mesa:BOOL=ON" \
    "-DENABLE_ffmpeg:BOOL=ON" \
    "-DPARAVIEW_DEFAULT_SYSTEM_GL:BOOL=ON" \
    "-DENABLE_nvidiaindex:BOOL=ON" \
    "-DENABLE_qt5:BOOL=ON" \
    "-DENABLE_mpi:BOOL=ON" \
    "-DENABLE_silo:BOOL=ON" \
    "-DENABLE_paraview:BOOL=ON" \
    "-DENABLE_xdmf3:BOOL=ON" \
    "-DENABLE_h5py:BOOL=ON" \
    "-DBUILD_SHARED_LIBS:BOOL=ON" \
    "-Dvtkm_SOURCE_SELECTION:STRING=for-git" \
    "-DENABLE_paraviewtutorial:BOOL=OFF" \
    "-DENABLE_vtkm:BOOL=ON" \
    "-DENABLE_numpy:BOOL=ON" \
    "-DENABLE_vrpn:BOOL=ON" \
    "-DENABLE_paraviewusersguide:BOOL=OFF" \
    "-DENABLE_cosmotools:BOOL=ON" \
    "-DCMAKE_BUILD_TYPE:STRING=Release" \
    "-DENABLE_glu:BOOL=ON" \
    "-DENABLE_tbb:BOOL=ON" \
    "-DENABLE_boxlib:BOOL=ON" \
    "-Dsuperbuild_download_location:PATH=/home/paraview/downloads" \
    "-DENABLE_paraviewweb:BOOL=ON" \
    "-DENABLE_paraviewtutorialdata:BOOL=ON" \
    "-DENABLE_boost:BOOL=ON" \
    "-DENABLE_vortexfinder2:BOOL=ON" \
    "-DENABLE_python:BOOL=ON" \
    "-DDIY_SKIP_SVN:BOOL=ON" \
    "-DUSE_NONFREE_COMPONENTS:BOOL=ON" \
    "-DENABLE_matplotlib:BOOL=ON" \
    "-DENABLE_las:BOOL=ON" \
    "-DBUILD_TESTING:BOOL=ON" \
    "-DENABLE_scipy:BOOL=ON" \
    "-DENABLE_ospray:BOOL=ON" \
    "-DENABLE_acusolve:BOOL=ON" \
    "-DENABLE_fontconfig:BOOL=ON" \
    "-Dparaview_FROM_GIT:BOOL=ON" \
    "-Dparaview_GIT_TAG:STRING=$paraview_version" \
    "-Dparaview_FROM_SOURCE_DIR:BOOL=OFF" \
    "-DCTEST_USE_LAUNCHERS:BOOL=TRUE" \
    "-DCMAKE_INSTALL_PREFIX=/home/paraview/package" \
    "-GUnix Makefiles" \
    "/home/paraview/paraview-superbuild" 

make -j1
make install
