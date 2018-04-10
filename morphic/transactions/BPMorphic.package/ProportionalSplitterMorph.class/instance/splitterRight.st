adjacent splitters
splitterRight
	| _gsSqueakTemp_immediateRight |
	_gsSqueakTemp_immediateRight := nil.
	self
		siblingSplittersDo: [:each | each x > self x
				ifTrue: [_gsSqueakTemp_immediateRight
						ifNil: [_gsSqueakTemp_immediateRight := each]
						ifNotNil: [each x < _gsSqueakTemp_immediateRight x
								ifTrue: [_gsSqueakTemp_immediateRight := each]]]].
	^ _gsSqueakTemp_immediateRight