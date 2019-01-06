# R deb package creation for Rasbian on the Raspberry Pi

This doc is a total mess and needs a lot of tidying up.

The builds should be considered **very experimental** at this stage.

Pre-built versions are available from [builds.sellorm.com](https://builds.sellorm.com).

## make a directory

```
mkdir -p r-builds/pkgs/R-3.5.1/DEBIAN
cd r-builds/pkgs/R-3.5.1/
```

## build a skeleton deb control file

```
cat <<EOF >> DEBIAN/control
Package: R-3.5.1
Architecture: armhf
Maintainer: @sellorm
Priority: optional
Version: 0.1
Description: RinProd build of R
EOF
```

## Copy the pre-built binary artifacts into it

```
cp -r ../../R-3.5.1/* ./
mkdir -p opt/R/3.5.1
mv bin opt/R/3.5.1/
mv etc  opt/R/3.5.1/
mv doc opt/R/3.5.1/
mv lib opt/R/3.5.1/
mv library/ opt/R/3.5.1/
mv COPYING opt/R/3.5.1/
mv modules opt/R/3.5.1/
```

## build the package

```
dpkg-deb --build ./
```

## install the package using gdebi

```
apt-get install gdebi-core
sudo gdebi -n R-3.5.1_0.2.deb 
dpkg -r R-3.5.1.deb 
```

## run R

```
/opt/R/3.5.1/bin/R
```

sudo update-alternatives --install /usr/local/bin/R R /opt/R/3.5.1/bin/R 1
R
vi R-3.5.1/DEBIAN/postinst
chmod 755 R-3.5.1/DEBIAN/postinst
dpkg-deb --build R-3.5.1
vi R-3.5.1/DEBIAN/control
dpkg-deb --build R-3.5.1
sudo gdebi R-3.5.1.deb 
R --version
vi R-3.5.1/DEBIAN/postinst 
dpkg-deb --build R-3.5.1
Rscript 
cd..
cd ..
wget https://cloud.r-project.org/src/base/R-3/R-3.5.2.tar.gz
tar zxvf R-3.5.2.tar.gz 
cd R-3.5.2/
./configure --prefix=/opt/R/3.5.2 --enable-R-shlib --with-blas --with-lapack
make
make check
vi Makefile
./bin/R

## make the necessary package files

```
cd pkgs
mkdir R-3.5.2
mkdir -p R-3.5.2/DEBIAN
cp R-3.5.1/DEBIAN/* ./R-3.5.2/DEBIAN/
cd ./R-3.5.2/DEBIAN/
vi control 
vi postinst 
```

## Move the built version of r into the package structure

```
cd ../
mkdir -p opt/R/3.5.2/
mv ../../R-3.5.2/bin opt/R/3.5.2/
mv ../../R-3.5.2/COPYING opt/R/3.5.2/
mv ../../R-3.5.2/lib opt/R/3.5.2/
mv ../../R-3.5.2/library opt/R/3.5.2/
mv ../../R-3.5.2/etc opt/R/3.5.2/
mv ../../R-3.5.2/doc opt/R/3.5.2/
mv ../../R-3.5.2/modules opt/R/3.5.2/
```

dpkg-deb --build R-3.5.2 R-3.5.2_1.deb
cd ..
dpkg-deb --build R-3.5.2 R-3.5.2_1.deb
python
vi dcf-version.py
chmod +x dcf-version.py 
./dcf-version.py 
vi dcf-version.py
./dcf-version.py R-3.5.2/DEBIAN/control 
vi dcf-version.py
./dcf-version.py R-3.5.2/DEBIAN/control 
./dcf-version.py R-3.5.1/DEBIAN/control 
vi ./dcf-version.py R-3.5.1/DEBIAN/control
vi R-3.5.1/DEBIAN/control
vi R-3.5.2/DEBIAN/control
dpkg-deb --build R-3.5.1 R-3.5.1_$(./dcf-version.py R-3.5.1/DEBIAN/control).deb
sudo gdebi -n R-3.5.1_3.deb 
sudo gdebi -n R-3.5.2_1.deb 
update-alternatives --list R
update-alternatives --config R
sudo update-alternatives --config R
R
sudo update-alternatives --config R
R
sudo update-alternatives --config R
./opt/R/3.5.2/bin/R
./configure --prefix=/opt/R/3.5.2 --enable-R-shlib --with-blas --with-lapack
make
make check
make clean
rm -r ../pkgs/R-3.5.2/opt/R/3.5.2/*
cp -r bin ../pkgs/R-3.5.2/opt/R/3.5.2/
cp -r etc ../pkgs/R-3.5.2/opt/R/3.5.2/
cp -r COPYING ../pkgs/R-3.5.2/opt/R/3.5.2/
cp -r lib ../pkgs/R-3.5.2/opt/R/3.5.2/
cp -r library ../pkgs/R-3.5.2/opt/R/3.5.2/
cp -r modules ../pkgs/R-3.5.2/opt/R/3.5.2/
cp -r doc ../pkgs/R-3.5.2/opt/R/3.5.2/
cd ../pkgs/R-3.5.2/opt/R/3.5.2/
cd ../..
cd ..
vi DEBIAN/control 
cd ..
dpkg-deb --build R-3.5.2 R-3.5.2_$(./dcf-version.py R-3.5.2/DEBIAN/control).deb
sudo dpkg -i R-3.5.2_2.deb 
R
update-alternatives --list R
update-alternatives --get-active
update-alternatives --get-selected
update-alternatives --
update-alternatives --get-selections R
update-alternatives --get-selections
cp -r R-3.5.2 ./R3.4.3
uname --help
uname -i
uname -p
uname -m
cd ..
wget https://cloud.r-project.org/src/base/R-3/R-3.4.4.tar.gz
tar zxvf R-3.4.4.tar.gz 
rm -r ./pkgs/R3.4.3/opt/R/*
cd R-3.4.4
./configure ../pkgs/R3.4.3/opt/R/3.4.4 --enable-R-shlib --with-blas --with-lapack
./configure --prefix=../pkgs/R3.4.3/opt/R/3.4.4 --enable-R-shlib --with-blas --with-lapack
./configure --prefix=/home/mds/r-build/pkgs/R3.4.3/opt/R/3.4.4 --enable-R-shlib --with-blas --with-lapack
make
make check
make install
mv ../pkgs/R3.4.3/ ../pkgs/R-3.4.4
cd ../pkgs/R-3.4.4
vi DEBU
vi DEBIAN/control 
vi DEBIAN/postinst 
cd ..
dpkg-deb --build R-3.4.4 R-3.4.4_$(./dcf-version.py R-3.4.4/DEBIAN/control).deb
dpkg-deb --build R-3.4.4 R-3.4.4_$(./dcf-version.py R-3.4.4/DEBIAN/control)_armhf.deb


## the whole thing

```
vi R-3.4.4/DEBIAN/control
vi build_deb.sh
chmod +x build_deb.sh 
./build_deb.sh R-3.4.4
sudo gdebi R-3.4.4_2_armhf.deb 
sudo update-alternatives --config R
R
make clean
./configure --prefix=/opt/R/3.4.4 --enable-R-shlib --with-blas --with-lapack
make
cd ../pkgs/R-3.4.4/
cd opt/R/3.4.4/
cp -r ~/r-builds/R-3.4.4/bin ./
cp -r ~/r-builds/R-3.4.4/doc ./
cp -r ~/r-builds/R-3.4.4/etc ./
cp -r ~/r-builds/R-3.4.4/lib ./
cp -r ~/r-builds/R-3.4.4/library ./
cp -r ~/r-builds/R-3.4.4/modules ./
cp -r ~/r-builds/R-3.4.4/COPYING ./
cd ~/r-builds/pkg
cd ~/r-builds/pkgs/
vi R-3.4.4/DEBIAN/control 
./build_deb.sh R-3.4.4
sudo gdebi -n R-3.4.4_3_armhf.deb 
R
```

