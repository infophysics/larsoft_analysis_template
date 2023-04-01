#! /bin/bash
#------------Setup Environment Variables------------#
source common.sh

#--------------------Setup LArSoft------------------#
source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
setup larsoft $LARSOFT_VERSION -q $LARSOFT_QUALS
setup ninja

#--------------------Create new development---------#
cd $LARSOFT_INSTALL_DIRECTORY
mrb newDev
source localProducts*/setup

#-----------------Specifying packages---------------#
cd $MRB_SOURCE
# here we specify the packages we need
# e.g. 
# "mrb g larsoft@<version>"
# "mrb g larsim@<version>"
mrb g larsoft@$LARSOFT_VERSION
# mrb g larsoftobj_suite@LARSOFT_VERSION
# mrb g larutils@LARSOFT_VERSION
# mrb g larbatch@LARSOFT_VERSION
# mrb g dune_suite@LARSOFT_VERSION
# mrb g -d dune_raw_data dune-raw-data

#------------------Custom code part-----------------#
# here we put any special code that needs to
# be executed for the custom package.
cd $MRB_SOURCE/larana/
mkdir -p $MY_CUSTOM_ANALYSIS_DIR
cp -r $ANALYSIS_TEMPLATE_DIR/src $MRB_SOURCE/larana/$MY_CUSTOM_ANALYSIS_DIR
sed -i '$ a add_subdirectory(MyAnalysis)' CMakeLists.txt

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

cd $ANALYSIS_TEMPLATE_DIR
