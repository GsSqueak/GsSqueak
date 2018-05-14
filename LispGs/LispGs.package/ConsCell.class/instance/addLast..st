accessing
addLast: anObject
  self lastCell cdr: (self class car: anObject)