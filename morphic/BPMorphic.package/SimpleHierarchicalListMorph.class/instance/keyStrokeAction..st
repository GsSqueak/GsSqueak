event handling
keyStrokeAction: event 
	| _gsSqueakTemp_numArgs |
	keystrokeActionSelector
		ifNil: [^ false].
	_gsSqueakTemp_numArgs := keystrokeActionSelector numArgs.
	_gsSqueakTemp_numArgs = 1
		ifTrue: [^ model perform: keystrokeActionSelector with: event keyCharacter].
	_gsSqueakTemp_numArgs = 2
		ifTrue: [^ model
				perform: keystrokeActionSelector
				with: event keyCharacter
				with: self].
	_gsSqueakTemp_numArgs = 3
		ifTrue: [^ model
				perform: keystrokeActionSelector
				with: event keyCharacter
				with: self
				with: event].
	^ self error: 'The keystrokeActionSelector must be a 1-, 2-, or 3-keyword symbol'