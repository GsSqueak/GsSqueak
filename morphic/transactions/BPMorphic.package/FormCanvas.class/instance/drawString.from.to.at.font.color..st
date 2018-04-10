drawing-text
drawString: aString from: firstIndex to: lastIndex at: aPoint font: fontOrNil color: c 
	| _gsSqueakTemp_font |
	port colorMap: nil.
	_gsSqueakTemp_font := fontOrNil
				ifNil: [TextStyle defaultFont].
	port combinationRule: Form paint.
	_gsSqueakTemp_font
		installOn: port
		foregroundColor: (self shadowColor
				ifNil: [c])
		backgroundColor: Color transparent.
	_gsSqueakTemp_font
		displayString: aString
		on: port
		from: firstIndex
		to: lastIndex
		at: origin + aPoint
		kern: 0