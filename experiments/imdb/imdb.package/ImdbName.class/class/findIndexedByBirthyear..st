searching
findIndexedByBirthyear: aYear
  ^ (GsQuery fromString: 'each.birthYear = ' + aYear asString on: self names)
    queryResult