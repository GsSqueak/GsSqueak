structure
activeHand
  ^ SessionTemps current
    at: #'ActiveHand'
    ifAbsent: [ 
      self isInWorld
        ifTrue: [ self world activeHand ] ]