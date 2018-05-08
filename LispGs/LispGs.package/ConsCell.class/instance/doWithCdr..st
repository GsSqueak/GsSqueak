iterating
doWithCdr: aBlock
  | cell |
  cell := self.
  [ cell isConsCell ]
    whileTrue: [ aBlock value: cell car value: (cell := cell cdr) ]