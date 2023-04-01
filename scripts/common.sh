#! /bin/bash
#--------------------Parameters---------------------#
export LARSOFT_VERSION=v09_49_00
export LARSOFT_COMPILER=e20
export LARSOFT_RELEASE=prof
export LARSOFT_QUALS={$LARSOFT_COMPILER}:{$LARSOFT_RELEASE}
export MY_CUSTOM_ANALYSIS_DIR=MyAnalysis

#---------------------Directory---------------------#
# this handy piece of code determines the absolute
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

export ANALYSIS_TEMPLATE_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

#--------------Installation Directory---------------#
export LARSOFT_INSTALL_DIRECTORY=$ANALYSIS_TEMPLATE_DIR/larsoft
mkdir -p $LARSOFT_INSTALL_DIRECTORY