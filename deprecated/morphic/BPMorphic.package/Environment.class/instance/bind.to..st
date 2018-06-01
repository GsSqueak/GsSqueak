binding
bind: aSymbol to: anObject 
	| _gsSqueakTemp_binding _gsSqueakTemp_newBinding |
	_gsSqueakTemp_newBinding := aSymbol => anObject.
	_gsSqueakTemp_binding := declarations
				associationAt: aSymbol
				ifAbsent: [].
	_gsSqueakTemp_binding
		ifNotNil: [_gsSqueakTemp_binding class == _gsSqueakTemp_newBinding class
				ifTrue: [_gsSqueakTemp_binding value: anObject]
				ifFalse: [_gsSqueakTemp_binding becomeForward: _gsSqueakTemp_newBinding].
			^ anObject].
	_gsSqueakTemp_binding := undeclared
				associationAt: aSymbol
				ifAbsent: [].
	_gsSqueakTemp_binding
		ifNil: [_gsSqueakTemp_binding := _gsSqueakTemp_newBinding]
		ifNotNil: [undeclared removeKey: aSymbol.
			_gsSqueakTemp_binding class == _gsSqueakTemp_newBinding class
				ifTrue: [_gsSqueakTemp_binding value: anObject]
				ifFalse: [_gsSqueakTemp_binding becomeForward: _gsSqueakTemp_newBinding]].
	declarations add: _gsSqueakTemp_binding.
	self binding: _gsSqueakTemp_binding addedTo: self.
	^ anObject