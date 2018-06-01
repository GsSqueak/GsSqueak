installation
installPhase2
  "Run as DataCurator to install code into GsSqueak environment"

  self
    installGsSqueakPackages: #('GsSqueak-ProofOfConcept1') environmentId: 7;
    installGsSqueakPackages:
        #('GsSqueak-ProofOfConcept1b' 'GsSqueak-ProofOfConcept1c-Tode')
      environmentId: 0;
    yourself
