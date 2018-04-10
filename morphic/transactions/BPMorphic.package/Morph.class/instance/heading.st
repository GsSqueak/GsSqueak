-Etoys-geometry
heading
  "Return the receiver's heading (in eToy terms)"

  self owner ifNil: [ ^ self forwardDirection ].
  ^ self forwardDirection + self owner degreesOfFlex