searching
findByBirthyear: aYear
^ self names select: [:aName | aName birthYear = aYear ]