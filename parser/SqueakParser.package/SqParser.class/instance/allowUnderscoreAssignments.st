private
allowUnderscoreAssignments
  "Query class + preference"

  ^ (encoder
    ifNotNil: [ :e | 
      e == self
        ifFalse: [ e classEncoding allowUnderscoreAssignments ] ])
    ifNil: [ super allowUnderscoreAssignments ]