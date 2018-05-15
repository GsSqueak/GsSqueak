printing
printOn: aStream depth: aNumber forLisp: aLisp level: cpl maxLevel: mpl length: len maxLength: mlen done: anIdentitySet cycles: anIdentityDictionary
  "the so-called 'level' controls the depth of nesting cons cells
	the 'length' controls the numbers of elements in a list to be printed
both refers to standard Common Lisp variables: respectively *print-level* and *print-length*

	see Common Lisp the Language,  2nd edition, chapter 22.1.6"

  | depth |
  depth := aNumber.
  (anIdentityDictionary keys identityIncludes: self)
    ifTrue: [ 
      aStream
        nextPut: $#;
        nextPutAll: (anIdentityDictionary at: self) asString;
        nextPut: $=.
      anIdentitySet add: self ].
  depth isZero
    ifTrue: [ aStream nextPut: $( ].
  car isConsCell | car isArray
    ifTrue: [ 
      (anIdentitySet includes: car)
        ifTrue: [ 
          aStream
            nextPut: $#;
            nextPutAll: (anIdentityDictionary at: car) asString;
            nextPut: $# ]
        ifFalse: [ 
          (mpl notNil and: [ cpl >= mpl ])
            ifTrue: [ aStream nextPut: $# ]
            ifFalse: [ 
              car
                printOn: aStream
                depth: 0
                forLisp: aLisp
                level: cpl + 1
                maxLevel: mpl
                length: mlen
                maxLength: mlen
                done: anIdentitySet
                cycles: anIdentityDictionary ] ] ]
    ifFalse: [ 
      car
        printOn: aStream
        depth: depth + 1
        forLisp: aLisp
        level: cpl + 1
        maxLevel: mpl
        length: mlen
        maxLength: mlen
        done: anIdentitySet
        cycles: anIdentityDictionary ].
  cdr ifNil: [ ^ aStream nextPut: $) ].
  aStream space.
  (len notNil and: [ len = 1 ])
    ifTrue: [ ^ aStream nextPutAll: '...)' ].
  (cdr isConsCell
    and: [ (anIdentitySet includes: cdr) not ]
    and: [ (anIdentityDictionary keys identityIncludes: cdr) not ])
    ifTrue: [ 
      ^ cdr
        printOn: aStream
        depth: depth + 1
        forLisp: aLisp
        level: cpl
        maxLevel: mpl
        length: (len ifNotNil: [ len - 1 ])
        maxLength: mlen
        done: anIdentitySet
        cycles: anIdentityDictionary ].
  aStream
    nextPut: $.;
    space.
  (anIdentitySet includes: cdr)
    ifTrue: [ 
      aStream
        nextPut: $#;
        nextPutAll: (anIdentityDictionary at: cdr) asString;
        nextPut: $# ]
    ifFalse: [ 
      cdr
        printOn: aStream
        depth: 0
        forLisp: aLisp
        level: cpl
        maxLevel: mpl
        length: (len ifNotNil: [ len - 1 ])
        maxLength: mlen
        done: anIdentitySet
        cycles: anIdentityDictionary ].
  aStream nextPut: $)