printing
storeCycles: anIdentityDictionary with: anIdentitySet
  (anIdentitySet includes: self)
    ifTrue: [ 
      (anIdentityDictionary keys identityIncludes: self)
        ifFalse: [ anIdentityDictionary add: self -> (anIdentityDictionary size + 1) ].
      ^ anIdentityDictionary ].
  anIdentitySet add: self.
  car isConsCell | car isArray
    ifTrue: [ car storeCycles: anIdentityDictionary with: anIdentitySet ].
  cdr isConsCell | cdr isArray
    ifTrue: [ cdr storeCycles: anIdentityDictionary with: anIdentitySet ].
  ^ anIdentityDictionary