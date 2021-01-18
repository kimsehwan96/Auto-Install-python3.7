#!/bin/bash
#this script will be efficient only with revolution pi or raspberry pi

echo "installing python3.7 start"
#set -e 
sudo apt-get update -y
if [ $? -ne 0 ]; then
  echo "check your network"
else
  echo "apt-get update sucess"
fi
 
sudo apt-get upgrade -y

if [ $? -ne 0 ]; then
 echo "check you env"
fi

#install dependencies to build python 
sudo apt-get install -y libffi-dev libbz2-dev liblzma-dev && sudo apt-get install -y libsqlite3-dev libncurses5-dev libgdbm-dev zlib1g-dev && sudo apt-get install -y libreadline-dev libssl-dev tk-dev build-essential && sudo apt-get install -y libncursesw5-dev libc6-dev openssl git 

if [ $? -ne 0 ]; then
 echo "there is somethig missing dependencies to built Python !!"
 exit 1
fi

set +e

PWD=$(pwd)

if [ ! -e $PWD/python_src ]; then
 mkdir $PWD/python_src
 wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tar.xz
 tar xvf Python-3.7.2.tar.xz
 mv Python-3.7.2 $PWD/python_src
else
 echo "python_src exist !!"
fi

#for ssl modules delete "#"
sed -i "207s/#//g" $PWD/python_src/Python-3.7.2/Modules/Setup.dist
sed -i "211s/#//g" $PWD/python_src/Python-3.7.2/Modules/Setup.dist
sed -i "212s/#//g" $PWD/python_src/Python-3.7.2/Modules/Setup.dist
sed -i "213s/#//g" $PWD/python_src/Python-3.7.2/Modules/Setup.dist
sed -i "214s/#//g" $PWD/python_src/Python-3.7.2/Modules/Setup.dist

sudo sh $PWD/python_src/Python-3.7.2/configure

if [ $? -ne 0 ]; then
  echo "fail configure"
  exit 1
else
  echo "python configure success !!"
fi

#we will use 4 cores to bulid Python
sudo make -j 4

if [ $? -ne 0 ]; then
  echo "fail make"
  exit 1
else
  echo "python make success !!"
fi

sudo make install

if [ $? -ne 0 ]; then
  echo "fail make install"
  exit 1
else
  echo "python make install success !!"
fi

sudo rm -rf $PWD/python_src/Python-3.7.2
sudo rm -rf $PWD/python_src/Python-3.7.2.tar.xz
