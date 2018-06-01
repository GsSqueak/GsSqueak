dropping/grabbing
grabTransform
  "Return the transform for the receiver which should be applied during
	grabbing "

  ^ self owner
    ifNil: [ IdentityTransform new ]
    ifNotNil: [ self owner grabTransform ]