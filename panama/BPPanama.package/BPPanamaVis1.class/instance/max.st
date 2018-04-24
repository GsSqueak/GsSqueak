as yet unclassified
max
  | ret |
  ret := 0.
  statistic
    do: [ :each | 
      | c |
      c := each count.
      c > ret
        ifTrue: [ ret := c ] ].
  ^ ret