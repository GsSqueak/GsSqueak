installation
installPhase3
  | gsSqueak gsSqueakObjectClass |
  self installSystemUserPackages: #('GsSqueak-ProoofOfConcept2').
  gsSqueak := AllUsers userWithId: 'GsSqueak'.
  gsSqueakObjectClass := gsSqueak symbolList objectNamed: #'Object'.
  SmallInteger superclassForEnv: 7 put: gsSqueakObjectClass.
  (gsSqueak symbolList objectNamed: #'Smalltalk')
    at: #'SmallInteger'
    put: SmallInteger.
  System commit