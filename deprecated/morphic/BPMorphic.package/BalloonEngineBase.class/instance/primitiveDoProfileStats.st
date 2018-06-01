primitives-other
primitiveDoProfileStats
	"Turn on/off profiling. Return the old value of the flag."
	| _gsSqueakTemp_oldValue _gsSqueakTemp_newValue |
	_gsSqueakTemp_oldValue := doProfileStats.
	_gsSqueakTemp_newValue := interpreterProxy stackObjectValue: 0.
	_gsSqueakTemp_newValue := interpreterProxy booleanValueOf: _gsSqueakTemp_newValue.
	interpreterProxy failed
		ifFalse: [doProfileStats := _gsSqueakTemp_newValue.
			interpreterProxy pop: 2.
			"Pop rcvr, arg"
			interpreterProxy pushBool: _gsSqueakTemp_oldValue]