entry points
eval: aString
  | array |
  [ array := (RBParser parseExpression: '#' , aString) value ]
    on: Error
    do: [ ^ self lispError: 'Invalid Expression' ].
  array class == Array
    ifFalse: [ ^ self lispError: 'Invalid Expression' ].
  ^ self evaluate: array asCons