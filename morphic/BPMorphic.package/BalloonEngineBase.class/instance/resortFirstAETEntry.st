AET processing
resortFirstAETEntry
	| _gsSqueakTemp_edge _gsSqueakTemp_xValue _gsSqueakTemp_leftEdge |
	self aetStartGet = 0
		ifTrue: [^ nil].
	"Nothing to resort"
	_gsSqueakTemp_edge := aetBuffer at: self aetStartGet.
	_gsSqueakTemp_xValue := self edgeXValueOf: _gsSqueakTemp_edge.
	_gsSqueakTemp_leftEdge := aetBuffer at: self aetStartGet - 1.
	(self edgeXValueOf: _gsSqueakTemp_leftEdge)
			<= _gsSqueakTemp_xValue
		ifTrue: [^ nil].
	"Okay"
	self
		moveAETEntryFrom: self aetStartGet
		edge: _gsSqueakTemp_edge
		x: _gsSqueakTemp_xValue