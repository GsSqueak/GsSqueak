-Etoys
trailMorph
  "You can't draw trails on me, but try my owner."

  self owner isNil
    ifTrue: [ ^ nil ].
  ^ self owner trailMorph