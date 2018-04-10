accessing
wrapFlag
	^ textMorph
		ifNil: [false]
		ifNotNil: [:tm | tm isWrapped]