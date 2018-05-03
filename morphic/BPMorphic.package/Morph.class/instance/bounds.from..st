geometry
bounds: aRectangle from: referenceMorph
  "Return the receiver's bounds as seen by aMorphs coordinate frame"

  self owner ifNil: [ ^ aRectangle ].
  ^ (self owner transformFrom: referenceMorph) globalBoundsToLocal: aRectangle