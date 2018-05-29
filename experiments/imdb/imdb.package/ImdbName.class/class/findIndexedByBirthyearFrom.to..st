searching
findIndexedByBirthyearFrom: from to: to
  | qString |
  qString := '(each.birthYear >= ' + from asString + ') & (each.birthYear <= '
    + to asString + ')'.
  Transcript show: qString.
  ^ (GsQuery fromString: qString on: self names) queryResult