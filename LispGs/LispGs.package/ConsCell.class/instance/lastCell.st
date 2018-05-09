accessing
lastCell
  | cell |
  cell := self.
  [ cell cdr notNil ] whileTrue: [ cell := cell cdr ].
  ^ cell