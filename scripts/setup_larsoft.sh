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

cd $ANALYSIS_TEMPLATE_DIR