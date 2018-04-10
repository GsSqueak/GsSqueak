initialize
translateShift
  | character |
  self buttons = 8
    ifFalse: [ ^ self ].
  character := self keyCharacter.
  character isLetter
    ifTrue: [ keyValue := character asUppercase asciiValue ]
    ifFalse: [ 
      keyValue := (self class translateDict at: character ifAbsent: [ character ])
        asciiValue ]