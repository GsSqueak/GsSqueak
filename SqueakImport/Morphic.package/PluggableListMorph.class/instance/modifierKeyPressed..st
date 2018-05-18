model access
modifierKeyPressed: aChar 
	| args |
	keystrokeActionSelector isNil ifTrue: [^nil].
	args := keystrokeActionSelector numArgs.
	args = 1 ifTrue: [^model perform: keystrokeActionSelector with: aChar].
	args = 2 
		ifTrue: 
			[^model 
				perform: keystrokeActionSelector
				with: aChar
				with: self].
	^self error: 'keystrokeActionSelector must be a 1- or 2-keyword symbol'