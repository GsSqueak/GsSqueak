rewriting
recRewrite: anObject
  | car cdr sym bsym s |
  anObject ifNil: [ ^ nil ].
  anObject isArray
    ifTrue: [ ^ (self recRewrite: anObject asConsList) topForms ].
  anObject isConsCell
    ifFalse: [ ^ anObject ].	"separating a stuck backquote from its following symbol"
  (anObject car isSymbol
    and: [ anObject car first == $` ]
    and: [ anObject car size > 1 ]
    and: [ anObject car second ~~ $` ])
    ifTrue: [ 
      | ncdr |
      ncdr := ConsCell car: anObject car allButFirst asSymbol cdr: anObject cdr.
      anObject car: $'.	"will be rewritten as (quote ...) later on"
      anObject cdr: ncdr ].	"turning a quasiquote into a plain quote whenever possible"
  (anObject car == #'`'
    and: [ 
      (anObject cdr car isSymbol
        and: [ (#($` $,) identityIncludes: anObject cdr car first) not ])
        or: [ 
          anObject cdr car isConsCell
            and: [ 
              anObject cdr car topForms
                noneSatisfy: [ :o | 
                  o isConsCell
                    or: [ o isSymbol and: [ o first == $, or: [ o beginsWith: 'unquote' ] ] ] ] ] ] ])
    ifTrue: [ anObject car: $' ].	"dotted pair notation"
  (anObject cdr isConsCell and: [ anObject cdr car == #'.' ])
    ifTrue: [ 
      anObject cdr cdr car == #','
        ifTrue: [ 
          "very special case: [. , -> ,@] 
					for example`(a b . ,c) becomes `(a b ,@c)"
          anObject cdr: (#',@' inCons lastCdr: anObject cdr cdr cdr) ]
        ifFalse: [ 
          self recRewrite: anObject cdr cdr.
          anObject setcdr: anObject cdr cdr car ] ].
  car := anObject car.
  cdr := anObject cdr.
  anObject car: (self recRewrite: car).
  anObject cdr: (self recRewrite: cdr).
  (car isSymbol or: [ car isCharacter ])
    ifFalse: [ ^ anObject ].
  (self sugarKeys identityIncludes: car)
    ifTrue: [ 
      anObject
        car:
          (ConsCell
            car: (self sugar at: car)
            cdr: (ConsCell car: anObject cdr car cdr: nil)).
      anObject cdr: cdr cdr ].
  anObject cdr isConsCell
    ifFalse: [ ^ anObject ].
  sym := anObject car.
  (sym == #'&' and: [ (bsym := anObject cdr car) isSymbol ])
    ifTrue: [ 
      anObject car: (sym , bsym) asSymbol.
      anObject cdr: anObject cdr cdr ].
  s := anObject cdr car.
  (#(#'!' #'?' #'*') identityIncludes: s)
    ifTrue: [ 
      anObject car: (sym , s) asSymbol.
      anObject cdr: anObject cdr cdr ].
  ((s == #'-' or: [ s == #'/' ])
    and: [ (bsym := anObject cdr cdr car) isSymbol ])
    ifTrue: [ 
      anObject car: (sym , s , bsym) asSymbol.
      anObject cdr: anObject cdr cdr cdr ].
  ^ anObject