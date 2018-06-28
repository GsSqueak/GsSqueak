as yet unclassified
setup
  | sampleSize i |
  sampleSize := 10000000.
  Employees := Bag new: sampleSize.
  i := 0.
  sampleSize
    timesRepeat: [ 
      i \\ 1000 = 0
        ifTrue: [ System commit ].
      i := i + 1.
      Employees add: Employee new ]
