installation
installPhase2
  "run as SystemUser"

  self
    installGsSqueakPackages: #('GsSqueak-ProofOfConcept1') environmentId: 7;
    installGsSqueakPackages: #('GsSqueak-ProofOfConcept1b') environmentId: 0;
    yourself