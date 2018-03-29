frame access
marryContextInNewStackPageAndInitializeInterpreterRegisters: aContext 
	"Establish aContext at the base of a new stackPage, make the
	stackPage the
	active one and set-up the interreter registers. This is used to boot the
	system and bring it back after a snapshot."
	| _gsSqueakTemp_newPage |
	self assert: stackPage = 0.
	_gsSqueakTemp_newPage := self makeBaseFrameFor: aContext.
	self setStackPageAndLimit: _gsSqueakTemp_newPage.
	self setStackPointersFromPage: _gsSqueakTemp_newPage.
	self
		setMethod: (self iframeMethod: stackPage headFP).
	instructionPointer := self popStack