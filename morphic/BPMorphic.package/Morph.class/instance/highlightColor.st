accessing
highlightColor
  ^ (self valueOfProperty: #'highlightColor')
    ifNil: [ self owner ifNil: [ self color ] ifNotNil: [ self owner highlightColor ] ]
    ifNotNil: [ :val | val ifNil: [ self error: 'nil highlightColor' ] ]