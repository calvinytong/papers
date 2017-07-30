#!/usr/bin/env bash

# Set hard fail on error
set -e

while getopts "hdvw:" opt
do
case "$opt" in
    h)
	echo $SCRIPTNAME: flags: -d debug, -v verbose, -h help
        echo "    -w WS directory"
	exit 0
	;;
    d)
        DEBUGGING=true
        ;;
    v)
        VERBOSE=true
        ;;
    w)
        WS_DIR="$OPTARG"
	;;
esac
done


function section {
    echo
    echo "##############################################################"
    echo $1
    echo "##############################################################"
    echo
}

# setup apt
function setup_apt {
    sudo apt-get update
    sudo apt-get -y upgrade
}


# install ubuntu dependencies
function install_ubuntu_deps {

    sudo apt-get install -y curl git
    sudo apt-get install -y python-virtualenv python3-matplotlib python3-dev libfreetype6-dev
    sudo apt-get install -y gcc gfortran python-dev libblas-dev liblapack-dev  # for numpy/scipy
    sudo apt-get install -y python3-tk # for tkinter
}

# create python virtual env in the ws_dir
function create_python_env {
    pushd .
    cd "$WS_DIR"

    # Create and activate a virtual environment using python3
    virtualenv -p /usr/bin/python3 venv
    source venv/bin/activate

    # Update pip. Ensures that whl files are used when available.
    pip install -U pip

    popd
}

section "Updating APT"
setup_apt

section "Installing Ubuntu Dependencies"
install_ubuntu_deps

section "Creating Python virtualenv. Will be put in the specified ws dir: $WS_DIR"
create_python_env

