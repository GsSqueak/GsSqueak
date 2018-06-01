as yet unclassified
sum
  | ret |
  ret := 0.
  statistic do: [ :each | ret := ret + each count ].
  ^ ret