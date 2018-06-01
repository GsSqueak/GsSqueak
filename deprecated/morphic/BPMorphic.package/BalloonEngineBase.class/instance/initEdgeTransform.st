other
initEdgeTransform
	| _gsSqueakTemp_transform |
	_gsSqueakTemp_transform := self edgeTransform.
	_gsSqueakTemp_transform
		at: 0
		put: (self cCoerce: 1.0 to: 'float').
	_gsSqueakTemp_transform
		at: 1
		put: (self cCoerce: 0.0 to: 'float').
	_gsSqueakTemp_transform
		at: 2
		put: (self cCoerce: 0.0 to: 'float').
	_gsSqueakTemp_transform
		at: 3
		put: (self cCoerce: 0.0 to: 'float').
	_gsSqueakTemp_transform
		at: 4
		put: (self cCoerce: 1.0 to: 'float').
	_gsSqueakTemp_transform
		at: 5
		put: (self cCoerce: 0.0 to: 'float').
	self hasEdgeTransformPut: 0