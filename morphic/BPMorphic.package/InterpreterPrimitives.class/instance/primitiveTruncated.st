arithmetic float primitives
primitiveTruncated
	"N.B. IMO we should be able to assume the receiver is a float because
	this primitive is specific to floats. eem 2/13/2017"
	| _gsSqueakTemp_rcvr _gsSqueakTemp_trunc |
	_gsSqueakTemp_rcvr := self stackFloatValue: 0.
	self successful
		ifTrue: [self
				cCode: [self
						mod: _gsSqueakTemp_rcvr
						f: (self addressOf: _gsSqueakTemp_trunc)]
				inSmalltalk: [_gsSqueakTemp_trunc := _gsSqueakTemp_rcvr = _gsSqueakTemp_rcvr
								ifTrue: [_gsSqueakTemp_rcvr truncated]
								ifFalse: [Float nan]].
			(_gsSqueakTemp_trunc between: objectMemory minSmallInteger asFloat and: objectMemory maxSmallInteger asFloat)
				ifTrue: [self
						stackTopPut: (objectMemory integerObjectOf: _gsSqueakTemp_trunc asInteger)]
				ifFalse: [self primitiveFail]]