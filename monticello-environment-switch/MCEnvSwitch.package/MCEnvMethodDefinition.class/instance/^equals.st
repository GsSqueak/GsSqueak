comparing
= aDefinition
  aDefinition == nil
    ifTrue: [ ^ false ].
  ^ super = aDefinition
    and: [ aDefinition source trimBoth = self source trimBoth ]
    and: [ aDefinition category = self category ]
    and: [ 
      self class useTimeStampInComparisons
        ifTrue: [ aDefinition timeStamp = self timeStamp ]
        ifFalse: [ true ] ]
    and: [ aDefinition environmentId = self environmentId ]