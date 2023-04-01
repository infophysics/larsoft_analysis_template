/**
 * @file    MyAnalysis_module.cc
 * @brief   A module for extracting truth/reco information about G4 particle trajectories
 *          and conducting some standard analysis tasks. 
 * @ingroup MyAnalysis
 * @author  Nicholas Carrara (nmcarrara@ucdavis.edu),
**/
// art framework includes
#include "art/Framework/Core/EDAnalyzer.h"
#include "art/Framework/Core/ModuleMacros.h"
#include "art/Framework/Principal/Event.h"
#include "art/Framework/Principal/Handle.h"
#include "art/Framework/Principal/Run.h"
#include "art/Framework/Principal/SubRun.h"
#include "art/Framework/Services/Registry/ServiceHandle.h"
#include "art/Persistency/Common/PtrMaker.h"
#include "canvas/Utilities/InputTag.h"
#include "canvas/Utilities/Exception.h"
#include "canvas/Persistency/Common/FindManyP.h"
#include "fhiclcpp/ParameterSet.h"
#include "messagefacility/MessageLogger/MessageLogger.h"
#include "fhiclcpp/types/Atom.h"
#include "fhiclcpp/types/Table.h"
#include "art_root_io/TFileService.h"

// larsoft includes
#include "larcoreobj/SimpleTypesAndConstants/geo_types.h"
#include "lardata/DetectorInfoServices/DetectorClocksService.h"
#include "lardataobj/Simulation/SimEnergyDeposit.h"
#include "nusimdata/SimulationBase/MCGeneratorInfo.h"
#include "nusimdata/SimulationBase/MCTruth.h"
#include "lardataobj/Simulation/SimChannel.h"
#include "larsim/Simulation/LArG4Parameters.h"
#include "larsim/Utils/TruthMatchUtils.h"
#include "lardata/ArtDataHelper/TrackUtils.h"
#include "nusimdata/SimulationBase/MCParticle.h"
#include "nusimdata/SimulationBase/MCTruth.h"

// ROOT includes
#include <TTree.h>
#include <TH1.h>
#include "TH1F.h"
#include "TGeoMaterial.h"
#include "TGeoElement.h"
#include <cmath>

#include "Configuration.h"

namespace my_analysis
{
    /**
     * @brief MyAnalysis module for processing
     * MC data.
     */
    class MyAnalysis : public art::EDAnalyzer
    {
    public:
        explicit MyAnalysis(const Parameters& config);
        MyAnalysis(const MyAnalysis&) = delete;
        MyAnalysis(MyAnalysis&&) = delete;
        MyAnalysis& operator=(const MyAnalysis&) = delete;
        MyAnalysis& operator=(MyAnalysis&&) = delete;

        // required EDAnalyzer.unctions
        void analyze(const art::Event& event) override;
        void beginJob() override;
        void endJob() override;

    private:
        Parameters mParameters;
        /// ROOT output through art::TFileService
        /** We will save different TTrees to different TFiles specified 
         *  by the directories for each type.
         */ 
        art::ServiceHandle<art::TFileService> mTFileService;

    };

    // constructor
    MyAnalysis::MyAnalysis(const Parameters& config)
    : EDAnalyzer(config)
    , mParameters(config)
    {  
    }

    // begin job
    void MyAnalysis::beginJob()
    {
    }

    // analyze function
    void MyAnalysis::analyze(art::Event const& event)
    {
    }
    
    // end job
    void MyAnalysis::endJob()
    {
    }
}
DEFINE_ART_MODULE(my_analysis::MyAnalysis)
