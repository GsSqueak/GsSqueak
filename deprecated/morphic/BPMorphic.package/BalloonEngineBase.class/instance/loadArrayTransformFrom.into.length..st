loading state
loadArrayTransformFrom: transformOop into: destPtr length: n 
	"Load a transformation from the given array."
	| _gsSqueakTemp_value |
	0
		to: n - 1
		do: [:i | 
			_gsSqueakTemp_value := interpreterProxy fetchPointer: i ofObject: transformOop.
			((interpreterProxy isIntegerObject: _gsSqueakTemp_value)
					or: [interpreterProxy isFloatObject: _gsSqueakTemp_value])
				ifFalse: [^ interpreterProxy primitiveFail].
			(interpreterProxy isIntegerObject: _gsSqueakTemp_value)
				ifTrue: [destPtr
						at: i
						put: (self cCoerce: (interpreterProxy integerValueOf: _gsSqueakTemp_value) asFloat to: 'float')]
				ifFalse: [destPtr
						at: i
						put: (self
								cCoerce: (interpreterProxy floatValueOf: _gsSqueakTemp_value)
								to: 'float')]]