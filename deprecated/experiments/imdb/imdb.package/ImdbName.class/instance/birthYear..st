accessing
birthYear: anObject
  anObject ifNil: [ ^ birthYear := -1 ].
  birthYear := anObject