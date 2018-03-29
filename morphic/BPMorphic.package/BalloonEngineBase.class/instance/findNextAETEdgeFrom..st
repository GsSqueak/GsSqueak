AET processing
findNextAETEdgeFrom: leftEdge 
	| _gsSqueakTemp_depth _gsSqueakTemp_rightEdge |
	_gsSqueakTemp_depth := self edgeZValueOf: leftEdge.
	[self aetStartGet < self aetUsedGet]
		whileTrue: [_gsSqueakTemp_rightEdge := aetBuffer at: self aetStartGet.
			(self edgeZValueOf: _gsSqueakTemp_rightEdge)
					>= _gsSqueakTemp_depth
				ifTrue: [^ _gsSqueakTemp_rightEdge].
			self aetStartPut: self aetStartGet + 1].
	^ nil