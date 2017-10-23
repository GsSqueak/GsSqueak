installation
install
  self installGsSqueakUserPackages: #('GsSqueak-ProoofOfConcept1-GsSqueak').
  self
    executeAsSystemUser:
      '  | gsSqueak gsSqueakObjectClass |
  gsSqueak := AllUsers userWithId: ''GsSqueak''.
  gsSqueakObjectClass := gsSqueak symbolList objectNamed: #''Object''.
  SmallInteger superclassForEnv: 7 put: gsSqueakObjectClass.
  (gsSqueak symbolList objectNamed: #Smalltalk) at: #SmallInteger put: SmallInteger.
  System commit
'.
  self installGsSqueakUserPackages: #('GsSqueak-ProoofOfConcept2-GsSqueak')