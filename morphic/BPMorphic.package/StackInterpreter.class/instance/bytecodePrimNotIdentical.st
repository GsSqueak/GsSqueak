common selector sends
bytecodePrimNotIdentical
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	(objectMemory isOopForwarded: _gsSqueakTemp_rcvr)
		ifTrue: [_gsSqueakTemp_rcvr := self handleSpecialSelectorSendFaultFor: _gsSqueakTemp_rcvr].
	_gsSqueakTemp_arg := self internalStackValue: 0.
	(objectMemory isOopForwarded: _gsSqueakTemp_arg)
		ifTrue: [_gsSqueakTemp_arg := self handleSpecialSelectorSendFaultFor: _gsSqueakTemp_arg].
	self booleanCheat: _gsSqueakTemp_rcvr ~= _gsSqueakTemp_arg