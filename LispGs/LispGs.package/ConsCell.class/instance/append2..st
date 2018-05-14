accessing
append2: aConsCell
  | a |
  a := aConsCell isConsCell
    ifTrue: [ aConsCell listCopy ]
    ifFalse: [ aConsCell ].
  self append: a