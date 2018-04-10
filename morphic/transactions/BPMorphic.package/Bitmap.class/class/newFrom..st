as yet unclassified
newFrom: aCollection
  | newArray |
  newArray := self new: aCollection size.
  1 to: aCollection size do: [ :i | newArray at: i put: (aCollection at: i) ].
  ^ newArray