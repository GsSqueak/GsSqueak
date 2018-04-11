accessing
regularColor
  ^ (self valueOfProperty: #'regularColor')
    ifNil: [ self owner ifNil: [ self color ] ifNotNil: [ self owner regularColor ] ]
    ifNotNil: [ :val | val ifNil: [ self error: 'nil regularColor' ] ]