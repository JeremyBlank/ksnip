#!/bin/bash

if [[ "${BUILD_TYPE}" == "AppImage" ]]; then
    sudo add-apt-repository ppa:beineri/opt-qt562-trusty -y
    sudo apt-get update -qq
elif [[ "${BUILD_TYPE}" == "deb" ]]; then
    docker pull ubuntu:17.10
    docker run --name build-container -v `pwd`:`pwd` -w `pwd` -dit ubuntu:17.10 bash
elif [[ "${BUILD_TYPE}" == "rpm" ]]; then
    docker pull opensuse:42.2
    docker run --name build-container -v `pwd`:`pwd` -w `pwd` -dit opensuse:42.2 bash
elif [[ "${BUILD_TYPE}" == "exe" ]]; then
    export PATH=$QT_BIN_PATH:$PATH
    export PATH=$QT_BIN_PLUGIN:$PATH
    export LIBRARY_PATH=$KCOLORPICKER_LIB:$LIBRARY_PATH
    export CPLUS_INCLUDE_PATH=$KCOLORPICKER_INCLUDE:$CPLUS_INCLUDE_PATH
    export LIBRARY_PATH=$KIMAGEANNOTATOR_LIB:$LIBRARY_PATH
    export CPLUS_INCLUDE_PATH=$KIMAGEANNOTATOR_INCLUDE:$CPLUS_INCLUDE_PATH

    wget --quiet -O qtbase-563.7z https://download.qt.io/online/qtsdkrepository/windows_x86/desktop/qt5_563/qt.563.win32_msvc2015/5.6.3-0-201709190903qtbase-Windows-Windows_10-MSVC2015-Windows-Windows_10-X86.7z
fi
