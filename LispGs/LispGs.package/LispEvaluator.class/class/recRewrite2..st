rewriting
recRewrite2: anObject
  "second pass of recRewrite"

  | car cdr |
  anObject ifNil: [ ^ nil ].
  anObject isArray
    ifTrue: [ ^ (self recRewrite2: anObject asConsList) topForms ].
  anObject isConsCell
    ifFalse: [ ^ anObject ].
  car := anObject car.
  cdr := anObject cdr.
  anObject car: (self recRewrite2: car).
  anObject cdr: (self recRewrite2: cdr).
  car isSymbol
    ifFalse: [ ^ anObject ].	"see #rewriteString:"
  (car beginsWith: 'asciiValue')
    ifFalse: [ ^ anObject ].
  anObject car: (Character codePoint: (car last: 2) asNumber) asSymbol.
  ^ anObject