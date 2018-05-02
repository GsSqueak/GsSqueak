structure
world
  ^ self owner isNil
    ifFalse: [ self owner world ]