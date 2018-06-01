compilation
addPartNameLike: className withValue: aMorph
	| otherNames i default partName stem |
	stem := className first asLowercase asString , className allButFirst.
	otherNames := self class allInstVarNames.
	i := 1.
	[otherNames includes: (default := stem, i printString)]
		whileTrue: [i := i + 1].
	partName := UIManager default
		request: 'Please give this part a name'
		initialAnswer: default.
	(otherNames includes: partName)
		ifTrue: [self inform: 'Sorry, that name is already used'. ^ nil].
	self class addInstVarName: partName.
	self instVarAt: self class instSize put: aMorph.  "Assumes added as last field"
	^ partName