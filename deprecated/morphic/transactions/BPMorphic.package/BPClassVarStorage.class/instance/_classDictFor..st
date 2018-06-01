as yet unclassified
_classDictFor: aClass
  ^ classes
    at: aClass name asSymbol
    ifAbsent: [ ^ classes at: aClass name asSymbol put: IdentityDictionary new ]