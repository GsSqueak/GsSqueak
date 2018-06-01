drawing
hide
  self owner ifNil: [ ^ self ].
  self visible
    ifTrue: [ 
      self visible: false.
      self changed ]