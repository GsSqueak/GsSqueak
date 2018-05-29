
add: newObject withOccurrences: anInteger
  "Add newObject anInteger times to the receiver. Answer newObject."

  | originalObject |
  originalObject := (contents
    associationAt: newObject
    ifAbsent: [ newObject -> 1 ]) key.
  contents
    at: newObject
    put: (contents at: newObject ifAbsent: [ 0 ]) + anInteger.
  _indexedPaths ~~ nil
    ifTrue: [ 
      | idxRes |
      anInteger
        timesRepeat: [ 
          idxRes := self _env0 _updateIndexesForAdditionOf: originalObject logging: true.
          idxRes == true
            ifFalse: [ ^ self _env0 _raiseIndexingError: idxRes ] ] ].
  ^ newObject