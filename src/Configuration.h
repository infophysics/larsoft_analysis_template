/**
 * @file    Configuration.h
 * @author  Nicholas Carrara [nmcarrara@ucdavis.edu]
 * @brief   A struct for holding LArSoft configuration parameters
 *          for a custom analysis module.
 * @version 0.1
 * @date 2022-02-15
 */
#pragma once

// art framework includes
#include "art/Framework/Core/EDAnalyzer.h"
#include "art/Framework/Core/ModuleMacros.h"
#include "art/Framework/Principal/Event.h"
#include "art/Framework/Principal/Handle.h"
#include "art/Framework/Principal/Run.h"
#include "art/Framework/Principal/SubRun.h"
#include "art/Framework/Services/Registry/ServiceHandle.h"
#include "canvas/Utilities/InputTag.h"
#include "canvas/Utilities/Exception.h"
#include "canvas/Persistency/Common/FindManyP.h"
#include "fhiclcpp/ParameterSet.h"
#include "messagefacility/MessageLogger/MessageLogger.h"

namespace my_analysis
{
    struct Configuration
    {
        /**
         * @brief Producer and Instance labels.
         * 
         */
        fhicl::Atom<art::InputTag> LArGeantProducerLabel
        {
            fhicl::Name("LArGeantProducerLabel"),
            fhicl::Comment("Tag of the input data product for the largeant side of the simulation.")
        };
        
        fhicl::Atom<art::InputTag> IonAndScintProducerLabel
        {
            fhicl::Name("IonAndScintProducerLabel"),
            fhicl::Comment("Tag of the input data product for the IonAndScint side of the simulation.")
        };
        fhicl::Atom<art::InputTag> IonAndScintInstanceLabel
        {
            fhicl::Name("IonAndScintInstanceLabel"),
            fhicl::Comment("Tag of the input data product for the IonAndScint side of the simulation.")
        };
        fhicl::Atom<art::InputTag> SimChannelProducerLabel
        {
            fhicl::Name("SimChannelProducerLabel"),
            fhicl::Comment("Tag of the input data product for the SimChannelProducerLabel.")
        };

        fhicl::Atom<art::InputTag> SimChannelInstanceLabel
        {
            fhicl::Name("SimChannelInstanceLabel"),
            fhicl::Comment("Tag of the input data product for the SimChannelInstanceLabel.")
        };

        fhicl::Atom<art::InputTag> RawDigitProducerLabel
        {
            fhicl::Name("RawDigitProducerLabel"),
            fhicl::Comment("Tag of the input data product for the RawDigitProducerLabel.")
        };

        fhicl::Atom<art::InputTag> RawDigitInstanceLabel
        {
            fhicl::Name("RawDigitInstanceLabel"),
            fhicl::Comment("Tag of the input data product for the RawDigitInstanceLabel.")
        };
    };
    using Parameters = art::EDAnalyzer::Table<Configuration>;
}