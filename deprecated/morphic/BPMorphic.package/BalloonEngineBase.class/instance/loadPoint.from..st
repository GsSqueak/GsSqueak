loading state
loadPoint: pointArray from: pointOop 
	"Load the contents of pointOop into pointArray"
	| _gsSqueakTemp_value |
	(interpreterProxy fetchClassOf: pointOop)
			= interpreterProxy classPoint
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_value := interpreterProxy fetchPointer: 0 ofObject: pointOop.
	((interpreterProxy isIntegerObject: _gsSqueakTemp_value)
			or: [interpreterProxy isFloatObject: _gsSqueakTemp_value])
		ifFalse: [^ interpreterProxy primitiveFail].
	(interpreterProxy isIntegerObject: _gsSqueakTemp_value)
		ifTrue: [pointArray
				at: 0
				put: (interpreterProxy integerValueOf: _gsSqueakTemp_value)]
		ifFalse: [pointArray at: 0 put: (interpreterProxy floatValueOf: _gsSqueakTemp_value) asInteger].
	_gsSqueakTemp_value := interpreterProxy fetchPointer: 1 ofObject: pointOop.
	((interpreterProxy isIntegerObject: _gsSqueakTemp_value)
			or: [interpreterProxy isFloatObject: _gsSqueakTemp_value])
		ifFalse: [^ interpreterProxy primitiveFail].
	(interpreterProxy isIntegerObject: _gsSqueakTemp_value)
		ifTrue: [pointArray
				at: 1
				put: (interpreterProxy integerValueOf: _gsSqueakTemp_value)]
		ifFalse: [pointArray at: 1 put: (interpreterProxy floatValueOf: _gsSqueakTemp_value) asInteger]