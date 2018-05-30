accessing
stringToLed
	| i k actualString |
	i := scroller ifNil: [1].
	k := 1.
	actualString := String new: chars.
	actualString do: 
		[:m | 
		i > string size ifFalse: [actualString at: k put: (string at: i) asUppercase asCharacter].
		i := i + 1.
		k := k + 1].
	i := 1.
	submorphs do: 
		[:m | 
		m char: (actualString at: i).
		i := i + 1].
	self changed