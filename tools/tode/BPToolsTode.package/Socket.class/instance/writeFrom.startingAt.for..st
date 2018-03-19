as yet unclassified
writeFrom: aByteArray startingAt: startIndex for: length
  | result |
  result := self write: length from: aByteArray startingAt: startIndex.
  result isNil
    ifTrue: [ self error: self lastErrorString asString ].
  ^ result