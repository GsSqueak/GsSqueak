installation
installPhase3
  "Run as SystemUser to install code into SystemUser system dictionaries"

  | gsSqueak gsSqueakObjectClass |
  self installSystemUserPackages: #('GsSqueak-ProofOfConcept2').
  gsSqueak := AllUsers userWithId: 'GsSqueak'.
  gsSqueakObjectClass := gsSqueak symbolList objectNamed: #'Object'.
  SmallInteger superclassForEnv: 7 put: gsSqueakObjectClass.
  (gsSqueak symbolList objectNamed: #'Smalltalk')
    at: #'SmallInteger'
    put: SmallInteger.
  System commit
