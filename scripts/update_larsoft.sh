#! /bin/bash
#------------Setup Environment Variables------------#
source common.sh

#--------------------Setup LArSoft------------------#
source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
setup larsoft $LARSOFT_VERSION -q $LARSOFT_QUALS
setup ninja

cd $LARSOFT_INSTALL_DIRECTORY
source localProducts*/setup
mrbslp

#--------------------Custom updating code-----------#
# here we specify how we want to update our custom
# larsoft, e.g. by pulling some information into
cp -r $ANALYSIS_TEMPLATE_DIR/src $MRB_SOURCE/larana/$MY_CUSTOM_ANALYSIS_DIR

#--------------------Rebuild------------------------#
ninja -C $MRB_BUILDDIR -j 32 install

cd $ANALYSIS_TEMPLATE_DIR