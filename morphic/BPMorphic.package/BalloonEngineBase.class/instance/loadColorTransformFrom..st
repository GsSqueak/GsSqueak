loading state
loadColorTransformFrom: transformOop 
	"Load a 2x3 transformation matrix from the given oop.
	Return true if the matrix is not nil, false otherwise"
	| _gsSqueakTemp_okay _gsSqueakTemp_transform |
	_gsSqueakTemp_transform := self colorTransform.
	self hasColorTransformPut: 0.
	_gsSqueakTemp_okay := self
				loadTransformFrom: transformOop
				into: _gsSqueakTemp_transform
				length: 8.
	_gsSqueakTemp_okay
		ifFalse: [^ false].
	self hasColorTransformPut: 1.
	"Scale transform to be in 0-256 range"
	_gsSqueakTemp_transform at: 1 put: (_gsSqueakTemp_transform at: 1)
			* (self cCoerce: 256.0 to: 'float').
	_gsSqueakTemp_transform at: 3 put: (_gsSqueakTemp_transform at: 3)
			* (self cCoerce: 256.0 to: 'float').
	_gsSqueakTemp_transform at: 5 put: (_gsSqueakTemp_transform at: 5)
			* (self cCoerce: 256.0 to: 'float').
	_gsSqueakTemp_transform at: 7 put: (_gsSqueakTemp_transform at: 7)
			* (self cCoerce: 256.0 to: 'float').
	^ _gsSqueakTemp_okay