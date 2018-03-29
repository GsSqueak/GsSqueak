AET processing
indexForInsertingIntoAET: edge 
	"Find insertion point for the given edge in the AET"
	| _gsSqueakTemp_initialX _gsSqueakTemp_index |
	_gsSqueakTemp_initialX := self edgeXValueOf: edge.
	_gsSqueakTemp_index := 0.
	[_gsSqueakTemp_index < self aetUsedGet
		and: [(self
				edgeXValueOf: (aetBuffer at: _gsSqueakTemp_index))
				< _gsSqueakTemp_initialX]]
		whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1].
	[_gsSqueakTemp_index < self aetUsedGet
		and: [(self
					edgeXValueOf: (aetBuffer at: _gsSqueakTemp_index))
					= _gsSqueakTemp_initialX
				and: [self
						getSorts: (aetBuffer at: _gsSqueakTemp_index)
						before: edge]]]
		whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1].
	^ _gsSqueakTemp_index