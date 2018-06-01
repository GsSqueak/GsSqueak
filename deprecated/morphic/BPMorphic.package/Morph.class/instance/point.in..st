geometry
point: aPoint in: aReferenceMorph
  self owner ifNil: [ ^ aPoint ].
  ^ (self owner transformFrom: aReferenceMorph) localPointToGlobal: aPoint