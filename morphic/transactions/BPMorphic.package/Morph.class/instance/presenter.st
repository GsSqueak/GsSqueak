accessing
presenter
  ^ self owner
    ifNil: [ self currentWorld presenter ]
    ifNotNil: [ self owner presenter ]