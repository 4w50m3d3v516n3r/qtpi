#!/bin/bash

#variables
PYLINK="/bin/python"
IDFILE1=~/.ssh/id_rsa.pub
IDFILE2=~/.ssh/id_dsa.pub
PUBLIC_KEY1=~/.ssh/id_rsa.pub
PUBLIC_KEY2=~/.ssh/id_dsa.pub
QT_ARCHIVE_NAME=""
wait_key_press() {

    read -n 1 -s -r -p "Press any key to continue"
}

add_python_symlink() {
    echo "checking for python symlink in /bin"

    if [ -L ${PYLINK} ]; then
        if [ -e ${PYLINK} ]; then
            echo "Python is already correctly linked."
            return 0
        else
            echo "Link to python is broken."
        fi
    elif [ -e ${PYLINK} ]; then
        echo "Seems not to be a valid symlink, maybe a file"
        return 1
    else
        echo "The symlink to python does not exist."
        echo "Creating a symlink to the most current python version on the system"

        pyver=$(ls -1 /bin/python* | grep '[2-3]\{0,\}.$' | sort -r | head -n 1)

        if ! [ -z ${pyver} ]; then
            echo "Linking to python in $pyver"
            sudo ln -s $pyver /bin/python
            return 0
        else
            echo "cannot find a python interpreter in /bin"
            return 1
        fi

    fi

}

get_qt_from_git() {
    #Get QT from git, specific branch
    echo "Please give me the git version to download: " 
    read -r GITVERSION
    cd ~ || exit
    git clone https://code.qt.io/qt/qt5.git
    cd qt5 || exit
    git checkout $GITVERSION
    ./init-repository
}

choose_qt_everywhere_version() {
    cd ~ || exit
    PS3='Please choose the version of QT-Everywhere to download:'
    options=("1 Version 6.0.3" "2 Version 6.0.2" "3 Version 6.0.1" "4 Version 2 6.0.0" "5 Version 5.15.2"
        "6 Version 5.15.1" "7 Version 5.15.0" "8 Version 5.12.10"
        "9 Version 5.12.9" "10 Version 5.12.8" "11 Version 5.12.7"
        "12 Version 5.12.6" "13 Version 5.12.5" "14 Version 5.12.4"
        "15 Version 5.12.3" "16 Version 5.12.2" "17 Version 5.12.0"
        "18 Version 5.9.9" "19 Version 5.9.8" "20 Version 5.9.7"
        "21 Version 5.9.6" "22 Version 5.9.5" "23 Version 5.9.4"
        "24 Version 5.9.3" "25 Version 5.9.2" "26 Version 5.9.1" "27 Version 5.9.0")
    select opt in "${options[@]}"; do
        case $opt in
        "1 Version 6.0.3")
            echo "Downloading Version 6.0.3"
            QT_ARCHIVE_NAME="qt-everywhere-src-6.0.3.tar.xz"
            wget https://download.qt.io/official_releases/qt/6.0/6.0.3/single/qt-everywhere-src-6.0.3.tar.xz
            break
            ;;
        "2 Version 6.0.2")
            echo "Downloading Version 6.0.2"
            QT_ARCHIVE_NAME="qt-everywhere-src-6.0.2.tar.xz"
            wget https://download.qt.io/official_releases/qt/6.0/6.0.2/single/qt-everywhere-src-6.0.2.tar.xz
            break
            ;;
        "3 Version 6.0.1")
            echo "Downloading Version 6.0.1"
            QT_ARCHIVE_NAME="qt-everywhere-src-6.0.1.tar.xz"
            wget https://download.qt.io/official_releases/qt/6.0/6.0.1/single/qt-everywhere-src-6.0.1.tar.xz
            break
            ;;
        "4 Version 2 6.0.0")
            echo "Downloading Version 6.0.0"
            QT_ARCHIVE_NAME="qt-everywhere-src-6.0.0.tar.xz"
            wget https://download.qt.io/official_releases/qt/6.0/6.0.0/single/qt-everywhere-src-6.0.0.tar.xz
            break
            ;;
        "5 Version 5.15.2")
            echo "Downloading Version 5.15.2"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.15.2.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.15/5.15.2/single/qt-everywhere-src-5.15.2.tar.xz
            break
            ;;
        "6 Version 5.15.1")
            echo "Downloading Version 5.15.1"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.15.1.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.15/5.15.1/single/qt-everywhere-src-5.15.1.tar.xz
            break
            ;;
        "7 Version 5.15.0")
            echo "Downloading Version 5.15.0"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.15.0.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.15/5.15.0/single/qt-everywhere-src-5.15.0.tar.xz
            break
            ;;
        "8 Version 5.12.10")
            echo "Downloading Version 5.15.10"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.10.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.10/single/qt-everywhere-src-5.12.10.tar.xz
            break
            ;;
        "9 Version 5.12.9")
            echo "Downloading Version 5.12.9"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.9.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.9/single/qt-everywhere-src-5.12.9.tar.xz
            break
            ;;
        "10 Version 5.12.8")
            echo "Downloading Version 5.12.8"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.8.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.8/single/qt-everywhere-src-5.12.8.tar.xz
            break
            ;;
        "11 Version 5.12.7")
            echo "Downloading Version 5.12.7"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.7.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.7/single/qt-everywhere-src-5.12.7.tar.xz
            break
            ;;
        "12 Version 5.12.6")
            echo "Downloading Version 5.12.6"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.6.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.6/single/qt-everywhere-src-5.12.6.tar.xz
            break
            ;;
        "13 Version 5.12.5")
            echo "Downloading Version 5.12.5"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.5.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.5/single/qt-everywhere-src-5.12.5.tar.xz
            break
            ;;
        "14 Version 5.12.4")
            echo "Downloading Version 5.12.4"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.4.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.4/single/qt-everywhere-src-5.12.4.tar.xz
            break
            ;;
        "15 Version 5.12.3")
            echo "Downloading Version 5.12.3"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.3.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.3/single/qt-everywhere-src-5.12.3.tar.xz
            break
            ;;
        "16 Version 5.12.2")
            echo "Downloading Version 5.12.2"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.2.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.2/single/qt-everywhere-src-5.12.2.tar.xz
            break
            ;;
        "17 Version 5.12.0")
            echo "Downloading Version 5.12.0"
            QT_ARCHIVE_NAME="qt-everywhere-src-5.12.0.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.12/5.12.0/single/qt-everywhere-src-5.12.0.tar.xz
            break
            ;;
        "18 Version 5.9.9")
            echo "Downloading Version 5.9.9"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.9.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.9/single/qt-everywhere-opensource-src-5.9.9.tar.xz
            break
            ;;
        "19 Version 5.9.8")
            echo "Downloading Version 5.9.8"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.8.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.8/single/qt-everywhere-opensource-src-5.9.8.tar.xz
            break
            ;;
        "20 Version 5.9.7")
            echo "Downloading Version 5.9.7"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.7/single/qt-everywhere-opensource-src-5.9.7.tar.xz
            break
            ;;
        "21 Version 5.9.6")
            echo "Downloading Version 5.9.6"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.6.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.6/single/qt-everywhere-opensource-src-5.9.6.tar.xz
            break
            ;;
        "22 Version 5.9.5")
            echo "Downloading Version 5.9.5"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.5.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.5/single/qt-everywhere-opensource-src-5.9.5.tar.xz
            break
            ;;
        "23 Version 5.9.4")
            echo "Downloading Version 5.9.4"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.4.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.4/single/qt-everywhere-opensource-src-5.9.4.tar.xz
            break
            ;;
        "24 Version 5.9.3")
            echo "Downloading Version 5.9.3"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.3.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.3/single/qt-everywhere-opensource-src-5.9.3.tar.xz
            break
            ;;
        "25 Version 5.9.2")
            echo "Downloading Version 5.9.2"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.2.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.2/single/qt-everywhere-opensource-src-5.9.2.tar.xz
            break
            ;;
        "26 Version 5.9.1")
            echo "Downloading Version 5.9.1"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.1.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.1/single/qt-everywhere-opensource-src-5.9.1.tar.xz
            break
            ;;
        "27 Version 5.9.0")
            echo "Downloading Version 5.9.0"
            QT_ARCHIVE_NAME="qt-everywhere-opensource-src-5.9.0.tar.xz"
            wget https://download.qt.io/official_releases/qt/5.9/5.9.0/single/qt-everywhere-opensource-src-5.9.0.tar.xz
            break
            ;;

        *) echo "invalid option $REPLY" ;;
        esac
    done

    printf "Extracting archive %s\n" "$QT_ARCHIVE_NAME"
    #Extract archive
    #tar -xf $QT_ARCHIVE_NAME
    tar -xf $QT_ARCHIVE_NAME
    rm $QT_ARCHIVE_NAME
    cd qt-* || exit

}

#parameter count check
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "on_host.sh <RASPBERRY_IP>"
    echo "Example:"
    echo "on_host.sh pi@raspberrypi"
    echo "or:"
    echo "on_host.sh pi@192.168.177.33"
    exit 1
fi

#setup host packages
echo "Setting up required packages (local packages)"
sudo apt update
sudo apt-get -y install build-essential cmake unzip gfortran g++ gperf flex texinfo
sudo apt-get -y install gawk bison libncurses-dev autoconf automake tar
sudo apt-get -y install gcc git bison python gperf pkg-config gdb-multiarch wget

#create tooling directory and download ARM-Compiler, unpack
echo "Creating tooling directory"

mkdir ~/raspi
cd ~/raspi || exit
mkdir tools
cd tools || exit

#Download ARM Compiler
echo "Dowloading ARM Compiler... this may take a while...."
wget https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
echo "Extracting compiler binaries..."
tar -xvf gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
echo "removing compiler binary..."
rm gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz

#Create sysroot for cross-compilation
cd ~/raspi || exit
mkdir sysroot sysroot/usr sysroot/opt

#authenticate on py without keys
echo "Trying to establish SSH key-based authentication for your Raspberry Pi"
echo "Checking first, if you created already an ssh rsa or dsa id...."

if [ -f "$IDFILE1" ]; then
    echo "You have an RSA key."
    echo "Trying to setup your public RSA key on your Raspberry"
    ssh-copy-id -i $PUBLIC_KEY1 $1
elif [ -f "$IDFILE2" ]; then
    echo "You have an DSA key."
    echo "Trying to setup your public DSA key on your Raspberry"
    ssh-copy-id -i $PUBLIC_KEY2 $1
else
    echo "You have no DSA or RSA key, let's generate one."
    echo "Please choose the default location and file-name..."
    echo "Please choose to encrypt the private SSH key and choose a passphrase."
    echo "It is more secure."
    echo "Calling ssh-keygen..."
    #check, what kind of key needs to be created
    PS3='Please choose the type of key to generate:'
    options=("1 RSA" "2 DSA")
    select opt in "${options[@]}"; do
        case $opt in
        "1 RSA")
            echo "Ok. Let's create an RSA key."
            ssh-keygen -t rsa -b 4096
            break
            ;;
        "2 DSA")
            echo "Ok. Let's create an DSA key"
            ssh-keygen -t dsa
            break
            ;;
        *) echo "invalid option $REPLY" ;;
        esac
    done

    echo "Checking for your newly generated public key...."

    if [ -f "$PUBLIC_KEY1" ]; then
        echo "Trying to setup your public RSA key on your Raspberry"
        ssh-copy-id -i $PUBLIC_KEY1 $1
    elif [ -f "$PUBLIC_KEY2" ]; then
        echo "Trying to setup your public DSA key on your Raspberry"
        ssh-copy-id -i $PUBLIC_KEY2 $1
    else
        echo "Could not find either an default RSA or default DSA key. You have to authenticate yourself against rsync."
    fi

fi

#copy on_rpi.sh script to the pi
cd ~ || exit
echo "copying on_pi.sh to the Raspberry"
scp ./on_rpi.sh $1:/home/pi

#set execution flag on the script and run it
echo "running script to prepare the pi, on the pi. This may take a while...."
ssh $1 'source /home/pi/.bashrc && chmod +x /home/pi/on_rpi.sh && /home/pi/on_rpi.sh'

cd ~/raspi || exit
#Sync libraries from Raspberry Pi
echo "Syncing libraries from Raspberry Pi into Sysroot. Remeber to do this every time you add any libraries to the PI"
rsync -avz --rsync-path="sudo rsync" --delete $1:/lib sysroot
rsync -avz --rsync-path="sudo rsync" --delete $1:/usr/include sysroot/usr
rsync -avz --rsync-path="sudo rsync" --delete $1:/usr/lib sysroot/usr
rsync -avz --rsync-path="sudo rsync" --delete $1:/opt/vc sysroot/opt

#Adjust Symlinks to be relative
wget https://raw.githubusercontent.com/Kukkimonsuta/rpi-buildqt/master/scripts/utils/sysroot-relativelinks.py
chmod +x sysroot-relativelinks.py

#Create symlink to latest python version and point to /bin/python
add_python_symlink

#TODO: Check if there is a symlink to python, what kind of pyhton naming is used here
./sysroot-relativelinks.py sysroot

#choose to compile  qt from git or download qt-everywhere

PS3='Please choose which source distro to compile:'
options=("1 QT from GIT" "2 QT-Everywhere")
select opt in "${options[@]}"; do
    case $opt in
    "1 QT from GIT")
        echo "Ok. Checking out qt from git..."
        get_qt_from_git "$@"
        break
        ;;
    "2 QT-Everywhere")
        echo "Ok. Getting and extracting QT-Anywhere..."
        choose_qt_everywhere_version

        break
        ;;
    *) echo "invalid option $REPLY" ;;
    esac
done

#Cross Compile QT
#configure
echo "Configuring QT"

./configure \
    -release \
    -confirm-license \
    -opengl es2 \
    -no-pch \
    -device-option CROSS_COMPILE=~/raspi/tools/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- \
    -sysroot ~/raspi/sysroot \
    -device linux-rasp-pi3-vc4-g++ \
    -prefix "/usr/local/qt5pi" \
    -bindir "/usr/local/qt5pi/bin" \
    -libdir "/usr/local/qt5pi/lib" \
    -docdir "/usr/local/qt5pi/doc" \
    -headerdir "/usr/local/qt5pi/include/qt5" \
    -datadir "/usr/local/qt5pi/data" \
    -archdatadir "/usr/local/qt5pi/lib/qt5archd" \
    -plugindir "/usr/local/qt5pi/plugins" \
    -importdir "/usr/local/qt5pi/imports" \
    -translationdir "/usr/local/qt5pi/translations" \
    -sysconfdir "/usr/local/qt5pi/xdg" \
    -examplesdir "/usr/local/qt5pi/lib/examples" \
    -opensource \
    -plugin-sql-odbc \
    -plugin-sql-psql \
    -plugin-sql-sqlite \
    -no-sql-sqlite2 \
    -plugin-sql-tds \
    -system-sqlite \
    -system-harfbuzz \
    -system-zlib \
    -system-libpng \
    -system-libjpeg \
    -system-doubleconversion \
    -system-pcre \
    -openssl \
    -no-rpath \
    -skip qtwayland \
    -skip qtwebengine \
    -skip qtlocation \
    -verbose \
    -optimized-qmake \
    -dbus-linked \
    -no-strip \
    -no-separate-debug-info \
    -qpa xcb \
    -glib \
    -icu \
    -accessibility \
    -compile-examples \
    -no-directfb \
    -no-use-gold-linker \
    -no-mimetype-database \
    -no-feature-relocatable
echo "building QT, running make. Grab yourself a coffee and enjoy the show."
#build
make
#setup
echo "Installing Cross-Compiled qt on the raspi directory"
make install

#Setup qt5 on the pi
cd ~/raspi/sysroot/usr/local || exit

rsync -avz qt5pi $1:/usr/local

ssh $1 sudo ldconfig

echo "Done. Enjoy!"

wait_key_press
