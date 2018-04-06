class initialization
install
	| _gsSqueakTemp_smalltalk _gsSqueakTemp_env |
	self environment class == self
		ifTrue: [Transcript cr; show: 'Can''t install environments; they''re already installed'.
			^ self].
	_gsSqueakTemp_smalltalk := Smalltalk globals.
	_gsSqueakTemp_env := self basicNew initializeWithSystemDictionary: _gsSqueakTemp_smalltalk.
	Default := _gsSqueakTemp_env.
	Instances
		ifNil: [Instances := IdentityDictionary new].
	Instances at: _gsSqueakTemp_env info name put: _gsSqueakTemp_env.
	(_gsSqueakTemp_smalltalk at: #Undeclared)
		becomeForward: (_gsSqueakTemp_env at: #Undeclared).
	_gsSqueakTemp_smalltalk becomeForward: _gsSqueakTemp_env.
	Smalltalk garbageCollect