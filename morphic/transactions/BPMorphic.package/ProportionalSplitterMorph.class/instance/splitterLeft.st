adjacent splitters
splitterLeft
	| _gsSqueakTemp_immediateLeft |
	_gsSqueakTemp_immediateLeft := nil.
	self
		siblingSplittersDo: [:each | each x < self x
				ifTrue: [_gsSqueakTemp_immediateLeft
						ifNil: [_gsSqueakTemp_immediateLeft := each]
						ifNotNil: [each x > _gsSqueakTemp_immediateLeft x
								ifTrue: [_gsSqueakTemp_immediateLeft := each]]]].
	^ _gsSqueakTemp_immediateLeft