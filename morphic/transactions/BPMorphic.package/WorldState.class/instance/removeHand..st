hands
removeHand: aHandMorph
  "Remove the given hand from the list of hands for this world."

  (hands includes: aHandMorph)
    ifFalse: [ ^ self ].
  hands := hands copyWithout: aHandMorph.
  (SessionTemps current at: #'ActiveHand') == aHandMorph
    ifTrue: [ SessionTemps current at: #'ActiveHand' put: nil ]