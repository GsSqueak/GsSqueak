displaying
drawWideEdge: edge from: leftX 
	"Draw the given edge starting from leftX with the edge's fill.
	Return the end value of the drawing operation."
	| _gsSqueakTemp_rightX _gsSqueakTemp_fill _gsSqueakTemp_type _gsSqueakTemp_lineWidth |
	"Not for the moment"
	_gsSqueakTemp_type := self edgeTypeOf: edge.
	dispatchedValue := edge.
	self dispatchOn: _gsSqueakTemp_type in: WideLineWidthTable.
	_gsSqueakTemp_lineWidth := dispatchReturnValue.
	self dispatchOn: _gsSqueakTemp_type in: WideLineFillTable.
	_gsSqueakTemp_fill := self makeUnsignedFrom: dispatchReturnValue.
	_gsSqueakTemp_fill = 0
		ifTrue: [^ leftX].
	"Check if this line is only partially visible"
	"self assert:(self isFillColor: fill)."
	_gsSqueakTemp_rightX := leftX + _gsSqueakTemp_lineWidth.
	self
		fillSpan: _gsSqueakTemp_fill
		from: leftX
		to: _gsSqueakTemp_rightX.
	^ _gsSqueakTemp_rightX