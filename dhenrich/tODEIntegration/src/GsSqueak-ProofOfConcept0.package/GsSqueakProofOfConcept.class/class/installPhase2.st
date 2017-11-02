installation
installPhase2
  "run as SystemUser"

  self
    installGsSqueakPackages: #('GsSqueak-ProofOfConcept1') environmentId: 7;
    installGsSqueakPackages:
        #('GsSqueak-ProofOfConcept1b' 'GsSqueak-ProofOfConcept1c-Tode')
      environmentId: 0;
    yourself