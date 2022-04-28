#! /bin/bash
#---------------------Directory---------------------#
# this handy piece of code determines the relative
# directory that this script is in.
SOURCE="${BASH_SOURCE[0]}"
# resolve $SOURCE until the file is no longer a symlink
while [ -h "$SOURCE" ]; do 
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  # if $SOURCE was a relative symlink, we need to resolve it relative 
  # to the path where the symlink file was located
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" 
done
LARSOFT_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

#---------------------Installation Directory--------#
INSTALL_DIRECTORY=$LARSOFT_DIR/larsoft
mkdir -p $INSTALL_DIRECTORY
cd $INSTALL_DIRECTORY

#--------------------Versioning---------------------#
# specify the version of the larsoft packages.
LARSOFT_VERSION=v09_31_00
QUALS=e20:prof

#--------------------Setup LArSoft------------------#
source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
setup larsoft $LARSOFT_VERSION -q $QUALS
setup ninja

#--------------------Create new development---------#
mrb newDev
source localProducts*/setup

#-----------------Specifying packages---------------#
cd $MRB_SOURCE
# here we specify the packages we need
# e.g. 
# "mrb g larsoft@<version>"
# "mrb g larsim@<version>"
mrb g larsoft@$LARSOFT_VERSION 

#------------------Custom code part-----------------#
# here we put any special code that needs to
# be executed for the custom package.

#------------------Installation and ninja-----------#
cd $MRB_BUILDDIR
mrbsetenv
mrb install -j 32 --generator ninja

#------------------Custom search and fcl------------#
# here we specify any custom search paths and fcl
# file paths that we want our installation to know about.
CUSTOM_SEARCH_PATH=""
CUSTOM_FHICL_PATH=""

export FW_SEARCH_PATH="$FW_SEARCH_PATH:$CUSTOM_SEARCH_PATH"
export FHICL_FILE_PATH="$FHICL_FILE_PATH:$CUSTOM_FHICL_PATH"

cd $LARSOFT_DIR
