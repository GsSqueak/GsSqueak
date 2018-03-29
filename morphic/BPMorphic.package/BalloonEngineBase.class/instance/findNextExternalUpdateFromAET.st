AET processing
findNextExternalUpdateFromAET
	"Check the active edge table for any entries that cannot be handled by
	the engine itself.
	If there are any, return true. Otherwise, step the the edge to the next
	y value."
	| _gsSqueakTemp_edge _gsSqueakTemp_count _gsSqueakTemp_type |
	[self aetStartGet < self aetUsedGet]
		whileTrue: [_gsSqueakTemp_edge := aetBuffer at: self aetStartGet.
			_gsSqueakTemp_count := (self edgeNumLinesOf: _gsSqueakTemp_edge)
						- 1.
			_gsSqueakTemp_count = 0
				ifTrue: ["Edge at end -- remove it"
					self removeFirstAETEntry]
				ifFalse: ["Store remaining lines back"
					self edgeNumLinesOf: _gsSqueakTemp_edge put: _gsSqueakTemp_count.
					_gsSqueakTemp_type := self objectTypeOf: _gsSqueakTemp_edge.
					(_gsSqueakTemp_type bitAnd: GEPrimitiveWideMask)
							= GEPrimitiveEdge
						ifTrue: [^ true].
					"This is an external edge"
					self dispatchOn: _gsSqueakTemp_type in: EdgeStepTable.
					self resortFirstAETEntry.
					self aetStartPut: self aetStartGet + 1]].
	^ false