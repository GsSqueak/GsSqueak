initialize
initialize
  externals := OrderedCollection new: 100.
  span := Bitmap new: 2048.
  bitBlt := nil.
  self
    bitBlt:
      ((BitBlt toForm: (SessionTemps current at: #'Display'))
        destRect: (SessionTemps current at: #'Display') boundingBox;
        yourself).
  forms := #().
  deferred := false