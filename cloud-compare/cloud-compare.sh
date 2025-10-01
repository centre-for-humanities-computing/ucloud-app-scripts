# Usage:
# Run the "Ubuntu Xfce virtual desktop" app and add this file as "Optional paramters -> initialization".
# 
# The initialization can take 10-15 minutes as the app must be build from source.
# To speed up the build process, select a machine with many CPU's (>= 8).
#
# change version below to match latest tag from https://github.com/CloudCompare/CloudCompare/releases
#
# dependencies and build process is based on https://github.com/CloudCompare/CloudCompare/blob/master/.github/workflows/build.yml
# future releases might require other/additional packages and build arguments...

VERSION=v2.13.2 

sudo apt update

sudo apt install -qy cmake ninja-build \
          libqt5svg5-dev libqt5opengl5-dev qtbase5-dev qttools5-dev qttools5-dev-tools libqt5websockets5-dev \
          libtbb-dev \
          libavcodec-dev libavformat-dev libavutil-dev libswscale-dev \
          libboost-program-options-dev libboost-thread-dev \
          libeigen3-dev \
          libcgal-dev libcgal-qt5-dev libgdal-dev libpcl-dev \
          libdlib-dev libproj-dev libxerces-c-dev xvfb libjsoncpp-dev liblaszip-dev

git clone --recursive --branch "$VERSION" https://github.com/cloudcompare/CloudCompare.git

cd CloudCompare

mkdir build

cmake \
          -B build \
          -S . \
          -G Ninja \
          -DEIGEN_ROOT_DIR=/usr/include/eigen3 \
          -DJSON_ROOT_DIR=/usr/include/jsoncpp \
          -DDLIB_ROOT=/usr/include \
          -DCCCORELIB_USE_TBB=ON \
          -DPLUGIN_EXAMPLE_GL=ON \
          -DPLUGIN_EXAMPLE_IO=ON \
          -DPLUGIN_EXAMPLE_STANDARD=ON \
          -DPLUGIN_GL_QEDL=ON \
          -DPLUGIN_GL_QSSAO=ON \
          -DPLUGIN_IO_QADDITIONAL=ON \
          -DPLUGIN_IO_QCORE=ON \
          -DPLUGIN_IO_QE57=ON \
          -DE57_RELEASE_LTO=OFF \
          -DPLUGIN_IO_QPHOTOSCAN=ON \
          -DPLUGIN_IO_QLAS=ON \
          -DPLUGIN_IO_QRDB=ON \
          -DPLUGIN_IO_QRDB_FETCH_DEPENDENCY=ON \
          -DPLUGIN_IO_QRDB_INSTALL_DEPENDENCY=ON \
          -DPLUGIN_STANDARD_QANIMATION=ON \
          -DQANIMATION_WITH_FFMPEG_SUPPORT=OFF \
          -DPLUGIN_STANDARD_QBROOM=ON \
          -DPLUGIN_STANDARD_QCANUPO=ON \
          -DPLUGIN_STANDARD_QCOMPASS=ON \
          -DPLUGIN_STANDARD_QCSF=ON \
          -DPLUGIN_STANDARD_QFACETS=ON \
          -DPLUGIN_STANDARD_QHOUGH_NORMALS=ON \
          -DPLUGIN_STANDARD_QHPR=ON \
          -DPLUGIN_STANDARD_QM3C2=ON \
          -DPLUGIN_STANDARD_QPCV=ON \
          -DPLUGIN_STANDARD_QPOISSON_RECON=ON \
          -DPLUGIN_STANDARD_QSRA=ON \
          -DPLUGIN_STANDARD_QRANSAC_SD=ON \
          -DPLUGIN_STANDARD_QPCL=ON \
          -DPLUGIN_STANDARD_QCLOUDLAYERS=ON \
          -DPLUGIN_STANDARD_QVOXFALL=ON \
          -DBUILD_TESTING=ON

cmake --build build --parallel

sudo cmake --install build

# create desktop file
cat <<EOT >> ~/Desktop/CloudCompare.desktop
[Desktop Entry]
Version=1.0
Name=CloudCompare
Exec=CloudCompare
Type=Application
EOT

# make it executable to get rid of warning when clicking it, it might still in GNOME?
sudo chmod +x ~/Desktop/CloudCompare.desktop

echo "------------------- Installation Done -------------------"
echo "${bold}[INFO] You can now press Open Interface...${normal}"
