kerning
widthAndKernedWidthOfLeft: leftCharacter right: rightCharacterOrNil into: aTwoElementArray 
	"Set the first element of aTwoElementArray to the width of
	leftCharacter and 
	the second element to the width of left character when kerned
	with rightCharacterOrNil. Answer aTwoElementArray"
	"Actually, nearly all users of this actually want just the widthOf
	the leftCharacter, so we will default to that for speed. See
	other implementations for more complex cases"
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := self widthOf: leftCharacter.
	aTwoElementArray at: 1 put: _gsSqueakTemp_w.
	aTwoElementArray at: 2 put: _gsSqueakTemp_w
	"The old code, and what fonts which have pair-kerning would use
	- 
	w := self widthOf: leftCharacter.
	rightCharacterOrNil isNil
	ifTrue:[
	aTwoElementArray 
	at: 1 put: w; 
	at: 2 put: w]
	ifFalse:[
	k := self kerningLeft: leftCharacter right:
	rightCharacterOrNil. aTwoElementArray 
	at: 1 put: w; 
	at: 2 put: w+k].
	^aTwoElementArra
	"