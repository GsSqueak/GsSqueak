searching
findIndexedByBirthyear: aYear
  ^ self names select: [ :aName | aName birthYear = aYear ]