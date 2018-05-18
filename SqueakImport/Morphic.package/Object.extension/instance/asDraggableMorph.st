*morphic
asDraggableMorph
	"Converts the receiver into a Morph suitable for dragging"
	^(StringMorph contents: (
			(self respondsTo: #dragLabel) 
				ifTrue:[self dragLabel] 
				ifFalse:[self printString]))
		color: ((self userInterfaceTheme get: #textColor for: #TransferMorph) ifNil: [Color black]);
		font: ((self userInterfaceTheme get: #font for: #TransferMorph) ifNil: [TextStyle defaultFont])
		yourself