as yet unclassified
posToState
  self position x == self class getCommonState x
    ifFalse: [ self class getCommonState x: self position x ].
  self position y == self class getCommonState y
    ifFalse: [ self class getCommonState y: self position y ]