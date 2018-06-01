as yet unclassified
methodVarDict
  ^ MethodVarDict
    ifNil: [ 
      MethodVarDict := IdentityDictionary new.
      ^ MethodVarDict ]