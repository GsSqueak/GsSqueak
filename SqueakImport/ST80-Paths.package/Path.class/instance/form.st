accessing
form
	"Answer the receiver's form, or, if form is nil, then answer a 1 x 1 black 
	form (a black dot)."

	| aForm |
	form == nil
		ifTrue: 
			[aForm := Form extent: 1 @ 1.
			aForm fillBlack.
			^aForm]
		ifFalse: 
			[^form]