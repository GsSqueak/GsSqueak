loading state
loadEdgeTransformFrom: transformOop 
	"Load a 2x3 transformation matrix from the given oop.
	Return true if the matrix is not nil, false otherwise"
	| _gsSqueakTemp_transform _gsSqueakTemp_okay |
	self hasEdgeTransformPut: 0.
	_gsSqueakTemp_transform := self edgeTransform.
	_gsSqueakTemp_okay := self
				loadTransformFrom: transformOop
				into: _gsSqueakTemp_transform
				length: 6.
	interpreterProxy failed
		ifTrue: [^ nil].
	_gsSqueakTemp_okay
		ifFalse: [^ false].
	self hasEdgeTransformPut: 1.
	"Add the fill offset to the matrix"
	_gsSqueakTemp_transform
		at: 2
		put: (self cCoerce: (_gsSqueakTemp_transform at: 2)
					+ self destOffsetXGet asFloat to: 'float').
	_gsSqueakTemp_transform
		at: 5
		put: (self cCoerce: (_gsSqueakTemp_transform at: 5)
					+ self destOffsetYGet asFloat to: 'float').
	^ true