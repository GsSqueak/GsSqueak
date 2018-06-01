attributes
changeSelectionFontTo: aFont 
	| attr |
	aFont ifNil: [ ^ self ].
	attr := TextFontReference toFont: aFont.
	
	self openTypeIn.
	
	paragraph text
		addAttribute: attr
		from: self startIndex
		to:
			(self hasSelection
				ifTrue: [ self stopIndex - 1 min: paragraph text size ]
				ifFalse: [ paragraph text size ]).
	
	self closeTypeIn.
	
	paragraph composeAll.
	self recomputeSelection.
	morph changed