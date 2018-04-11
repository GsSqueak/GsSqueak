as yet unclassified
asByteArray
  | ret |
  ret := ByteArray new.
  self do: [ :eachChar | ret add: eachChar asInteger ].
  ^ ret