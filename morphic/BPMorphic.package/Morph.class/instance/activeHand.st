structure
activeHand
  ^ (Smalltalk at: #'ActiveHand')
    ifNil: [ 
      self isInWorld
        ifTrue: [ self world activeHand ] ]