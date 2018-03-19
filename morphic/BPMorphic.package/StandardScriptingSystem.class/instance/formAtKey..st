form dictionary
formAtKey: aString
  "Answer the form saved under the given key"

  Symbol
    hasInterned: aString
    ifTrue: [ :aKey | 
      ^ FormDictionary
        at: aKey
        ifAbsent: [ 
          self halt.
          FormDictionary at: #'SmallHalo-Grab' ] ].
  ^ FormDictionary at: #'Cat'