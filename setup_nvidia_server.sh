# SETUP OF NVIDIA SERVER AT https://courses.nvidia.com/
# VM RESETS EVERY 9 HOURS
# INSTALLS ALL NECESSARY DEPENDENCIES
cd
wget https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2.tar.gz
tar -xzf cmake-3.23.2.tar.gz 
apt get update
apt install libssl-dev
cd cmake-3.23.2
./bootstrap
make
make install
cd
rm cmake-3.23.2.tar.gz
apt install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt-get install python3.9
update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1
apt-get install build-essential git python3.9-dev python3-pip libopenexr-dev libxi-dev libglfw3-dev libglew-dev libomp-dev libxinerama-dev libxcursor-dev
apt install python3.9-distutils
python -m pip install --upgrade pip
echo "export PATH=\"/usr/local/cuda-11.0/bin:$PATH\"" >> .bashrc
echo "export LD_LIBRARY_PATH=\"/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH\"" >> .bashrc
git clone --recursive https://github.com/nvlabs/instant-ngp
cd instant-ngp
pip install -r requirements.txt 
cmake . -B build -DNGP_BUILD_WITH_GUI=OFF
cmake --build build --config RelWithDebInfo -j 16
cmake --build build --config RelWithDebInfo -j 16


# mkdir saved
# python ./scripts/run.py --mode nerf --scene ../r3live-related/hku_park_00/ --save_snapshot saved/hku_park_00.msgpack --save_mesh saved/hku_park_00.ply --train
