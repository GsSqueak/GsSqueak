model access
modifierKeyPressed: aChar 
	| _gsSqueakTemp_args |
	keystrokeActionSelector isNil
		ifTrue: [^ nil].
	_gsSqueakTemp_args := keystrokeActionSelector numArgs.
	_gsSqueakTemp_args = 1
		ifTrue: [^ model perform: keystrokeActionSelector with: aChar].
	_gsSqueakTemp_args = 2
		ifTrue: [^ model
				perform: keystrokeActionSelector
				with: aChar
				with: self].
	^ self error: 'keystrokeActionSelector must be a 1- or 2-keyword symbol'