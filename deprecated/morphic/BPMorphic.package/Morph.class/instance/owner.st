structure
owner
  "Returns the owner of this morph, which may be nil."

  owner2 = 'world'
    ifTrue: [ ^ self currentWorld ].
  ^ owner2