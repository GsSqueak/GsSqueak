private
compilePrimitiveLists
  "to be evaluated whenever new primitives are implemented"

  | var |
  CachedPrimitives := IdentityDictionary new.
  SpecialForms := Array
    streamContents: [ :sfstr | 
      var := Array
        streamContents: [ :pstr | 
          self specialFormSelectors
            do: [ :sel | 
              sfstr nextPut: sel.
              pstr nextPut: sel.
              CachedPrimitives
                at: sel
                put: (LispPrimitive selector: sel for: self) ].
          self primitiveSelectors
            do: [ :sel | 
              pstr nextPut: sel.
              CachedPrimitives
                at: sel
                put: (LispPrimitive selector: sel for: self) ] ] ].
  Primitives := var