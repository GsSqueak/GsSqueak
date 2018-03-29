inline primitive generated code
lowcodePrimitiveUint32GreatEqual
	"Lowcode instruction generator"
	| _gsSqueakTemp_second _gsSqueakTemp_value _gsSqueakTemp_first |
	_gsSqueakTemp_second := self internalPopStackInt32.
	_gsSqueakTemp_first := self internalPopStackInt32.
	_gsSqueakTemp_value := (self cCoerce: _gsSqueakTemp_first to: 'unsigned int')
					>= (self cCoerce: _gsSqueakTemp_second to: 'unsigned int')
				ifTrue: [1]
				ifFalse: [0].
	self internalPushInt32: _gsSqueakTemp_value