message sending
activateNewMethod
	| _gsSqueakTemp_methodHeader |
	_gsSqueakTemp_methodHeader := self justActivateNewMethod.
	"Now check for stack overflow or an event (interrupt, must scavenge,
	etc). "
	stackPointer < stackLimit
		ifTrue: [self
				handleStackOverflowOrEventAllowContextSwitch: (self canContextSwitchIfActivating: newMethod header: _gsSqueakTemp_methodHeader)]