construction
addLine
	"Append a divider line to this menu. Suppress duplicate lines."
	| _gsSqueakTemp_colorToUse |
	self hasItems
		ifFalse: [^ self].
	self lastSubmorph knownName = #line
		ifTrue: [^ self].
	_gsSqueakTemp_colorToUse := self userInterfaceTheme lineColor
				ifNil: [Color gray: 0.9].
	self addMorphBack: (Morph new color: _gsSqueakTemp_colorToUse;
			 hResizing: #spaceFill;
			
			height: (self userInterfaceTheme lineWidth
					ifNil: [2]);
			
			borderStyle: (self userInterfaceTheme lineStyle
					ifNil: [BorderStyle inset]);
			 borderColor: _gsSqueakTemp_colorToUse;
			 borderWidth: 1;
			 name: #line;
			 yourself)