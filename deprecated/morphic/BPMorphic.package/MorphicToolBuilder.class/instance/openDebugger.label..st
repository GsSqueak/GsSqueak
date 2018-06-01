opening
openDebugger: aSpec label: aString 
	| _gsSqueakTemp_morph |
	_gsSqueakTemp_morph := self openDebugger: aSpec.
	_gsSqueakTemp_morph isSystemWindow
		ifTrue: [_gsSqueakTemp_morph setLabel: aString]
		ifFalse: [_gsSqueakTemp_morph name: aString].
	^ _gsSqueakTemp_morph