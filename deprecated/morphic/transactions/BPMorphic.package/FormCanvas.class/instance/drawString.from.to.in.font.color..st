drawing-text
drawString: aString from: firstIndex to: lastIndex in: bounds font: fontOrNil color: c 
	| _gsSqueakTemp_font _gsSqueakTemp_portRect |
	port colorMap: nil.
	_gsSqueakTemp_portRect := port clipRect.
	port
		clipByX1: bounds left + origin x
		y1: bounds top + origin y
		x2: bounds right + origin x
		y2: bounds bottom + origin y.
	_gsSqueakTemp_font := fontOrNil
				ifNil: [TextStyle defaultFont].
	port combinationRule: Form paint.
	_gsSqueakTemp_font
		installOn: port
		foregroundColor: (self shadowColor
				ifNil: [c])
		backgroundColor: Color transparent.
	_gsSqueakTemp_font
		displayString: aString asString
		on: port
		from: firstIndex
		to: lastIndex
		at: bounds topLeft + origin
		kern: 0.
	port clipRect: _gsSqueakTemp_portRect