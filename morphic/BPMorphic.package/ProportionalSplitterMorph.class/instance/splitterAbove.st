adjacent splitters
splitterAbove
	| _gsSqueakTemp_immediatelyAbove |
	_gsSqueakTemp_immediatelyAbove := nil.
	self
		siblingSplittersDo: [:each | "Splitter y's map 0 at the bottom."
			each y > self y
				ifTrue: [_gsSqueakTemp_immediatelyAbove
						ifNil: [_gsSqueakTemp_immediatelyAbove := each]
						ifNotNil: [each y < _gsSqueakTemp_immediatelyAbove y
								ifTrue: [_gsSqueakTemp_immediatelyAbove := each]]]].
	^ _gsSqueakTemp_immediatelyAbove