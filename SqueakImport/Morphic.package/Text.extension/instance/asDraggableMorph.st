*Morphic-converting
asDraggableMorph

	^ self copy
		addAttribute: (TextFontReference toFont: ((self userInterfaceTheme get: #font for: #TransferMorph) ifNil: [TextStyle defaultFont]));
		asMorph