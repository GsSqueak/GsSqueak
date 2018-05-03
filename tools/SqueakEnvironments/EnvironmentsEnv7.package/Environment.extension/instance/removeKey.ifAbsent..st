*EnvironmentsEnv7-emulating
removeKey: aSymbol ifAbsent: aBlock 
	| _gsSqueakTemp_binding |
	self flag: #review.
	(declarations includesKey: aSymbol)
		ifFalse: [^ aBlock value].
	_gsSqueakTemp_binding := declarations associationAt: aSymbol.
	declarations removeKey: aSymbol.
	self binding: _gsSqueakTemp_binding removedFrom: self.
	^ _gsSqueakTemp_binding value
