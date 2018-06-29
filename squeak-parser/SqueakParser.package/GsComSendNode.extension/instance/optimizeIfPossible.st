*SqueakParser
optimizeIfPossible
  "returns true if optimization performed, false otherwise.
   Does not consider any possible Ruby env1 selectors."
  | sel op argSz args |
  (sel := selLeaf) _isSymbol ifFalse:[ sel := sel selector ].
  op := ControlOpDict at: sel otherwise: 0 .
  op ~~ 0 ifTrue:[ | clsBlkNode |
    clsBlkNode := GsComBlockNode .
    argSz := (args := arguments) size .
    argSz <= 1 ifTrue:[
      argSz == 1 ifTrue:[
        (sel == #ifTrue: or:[ sel == #ifFalse: 
          or:[ sel == #ifNil: or:[ sel == #ifNotNil: 
          or:[ sel == #or:  or:[ sel == #and: 
          or:[ sel == #timesRepeat:          ]]]]]]) ifTrue:[
            (args atOrNil: 1) class == clsBlkNode ifTrue:[
              controlOp := op . 
              ^ true
            ].
         ].
         (sel == #whileFalse: or:[ sel == #whileTrue: 
          or:[ sel == #untilFalse:  or:[ sel == #untilTrue:  ]]]) ifTrue:[
            ((args atOrNil: 1) class == clsBlkNode 
             and: [ rcvr class == clsBlkNode ]) ifTrue:[
              controlOp := op . 
              ^ true
             ]
         ].
      ].
      "argSize == 0"
      (sel == #untilFalse or:[ sel == #untilTrue 
        or:[ sel == #whileFalse or:[ sel == #whileTrue ]]]) 
        ifTrue:[
          rcvr class == clsBlkNode ifTrue:[
            controlOp := op .
            ^ true
          ].
      ].
      ^ false .
    ].
    argSz == 2 ifTrue:[
      (sel == #ifTrue:ifFalse:  or:[ sel == #ifFalse:ifTrue:  or:[
       sel == #ifNil:ifNotNil:  or:[ sel == #ifNotNil:ifNil:  ]]]) ifTrue:[
         ((args atOrNil: 1) class == clsBlkNode 
          and:[ (args atOrNil: 2) class == clsBlkNode ]) ifTrue:[
            controlOp := op .
            ^ true
          ].
       ]. 
       (sel == #to:do: or:[ sel == #_downTo:do:])  ifTrue:[
          (args atOrNil: 2) class == clsBlkNode ifTrue:[
            controlOp := op .
            ^ true
          ].
       ].
       ^ false
    ].
    (sel == #to:by:do: or:[ sel ==  #_downTo:by:do: ]) ifTrue:[
      (args atOrNil: 3) class == clsBlkNode  ifTrue:[
         controlOp := op .
         ^ true
      ].
    ].
  ].
  ^ false


