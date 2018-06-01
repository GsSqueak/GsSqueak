loading state
loadWordTransformFrom: transformOop into: destPtr length: n 
	"Load a float array transformation from the given oop"
	| _gsSqueakTemp_srcPtr |
	_gsSqueakTemp_srcPtr := self
				cCoerce: (interpreterProxy firstIndexableField: transformOop)
				to: 'float *'.
	0
		to: n - 1
		do: [:i | destPtr
				at: i
				put: (_gsSqueakTemp_srcPtr at: i)]