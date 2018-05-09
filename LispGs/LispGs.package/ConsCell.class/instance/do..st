iterating
do: aBlock
  | cell |
  cell := self.
  [ cell isConsCell ]
    whileTrue: [ 
      aBlock value: cell car.
      cell := cell cdr ]