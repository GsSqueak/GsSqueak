adjacent splitters
splitterBelow
	| _gsSqueakTemp_immediatelyBelow |
	_gsSqueakTemp_immediatelyBelow := nil.
	self
		siblingSplittersDo: [:each | each y < self y
				ifTrue: [_gsSqueakTemp_immediatelyBelow
						ifNil: [_gsSqueakTemp_immediatelyBelow := each]
						ifNotNil: [each y > _gsSqueakTemp_immediatelyBelow y
								ifTrue: [_gsSqueakTemp_immediatelyBelow := each]]]].
	^ _gsSqueakTemp_immediatelyBelow