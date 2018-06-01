accessing
aaTransform
	"Return a transformation for the current anti-aliasing level"
	| _gsSqueakTemp_matrix |
	_gsSqueakTemp_matrix := MatrixTransform2x3 withScale: self aaLevel asFloat asPoint.
	_gsSqueakTemp_matrix offset: (self aaLevel // 2) asFloat asPoint.
	^ _gsSqueakTemp_matrix
		composedWith: (MatrixTransform2x3 withOffset: destOffset asFloatPoint)