layout
requiredWidth
	submorphs isEmpty ifTrue: [^self basicWidth].
	^(submorphs detectSum: [:m | m width]) + (submorphs size * padding)