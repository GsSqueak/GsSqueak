-Etoys-geometry
heading: newHeading
  "Set the receiver's heading (in eToy terms)"

  self isFlexed
    ifFalse: [ self addFlexShell ].
  self owner rotationDegrees: newHeading - self forwardDirection