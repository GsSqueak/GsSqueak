I/O primitives
primitiveScreenScaleFactor
	"Answer a float indicating the current scale factor for pixels of the
	Smalltalk window."
	| _gsSqueakTemp_factor |
	_gsSqueakTemp_factor := self ioScreenScaleFactor.
	self failed
		ifTrue: [^ self primitiveFail].
	self pop: 1;
		 pushFloat: _gsSqueakTemp_factor