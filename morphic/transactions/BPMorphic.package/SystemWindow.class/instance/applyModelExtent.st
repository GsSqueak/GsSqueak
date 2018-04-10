initialization
applyModelExtent
	| _gsSqueakTemp_initialExtent |
	_gsSqueakTemp_initialExtent := Preferences bigDisplay
				ifTrue: [(model initialExtent * 1.5) rounded]
				ifFalse: [model initialExtent].
	self extent: _gsSqueakTemp_initialExtent