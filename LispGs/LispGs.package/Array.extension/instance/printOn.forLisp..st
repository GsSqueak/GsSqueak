*LispGs
printOn: aStream forLisp: aLisp
  | mlen mlev |
  mlen := aLisp ifNil: [ nil ] ifNotNil: [ aLisp printLength ].
  mlev := aLisp ifNil: [ nil ] ifNotNil: [ aLisp printLevel ].
  (aLisp isNil or: [ aLisp printCircle == aLisp trueValue ])
    ifTrue: [ 
      ^ self
        printOn: aStream
        depth: 0
        forLisp: aLisp
        level: 1
        maxLevel: mlev
        length: mlen
        maxLength: mlen
        done: IdentitySet new
        cycles: self cycles ].
  self
    printOn: aStream
    depth: 0
    forLisp: aLisp
    level: 1
    maxLevel: mlev
    length: mlen
    maxLength: mlen
    done: IdentitySet new
    cycles: IdentityDictionary new