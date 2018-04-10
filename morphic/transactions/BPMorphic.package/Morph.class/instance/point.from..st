geometry
point: aPoint from: aReferenceMorph
  self owner ifNil: [ ^ aPoint ].
  ^ (self owner transformFrom: aReferenceMorph) globalPointToLocal: aPoint