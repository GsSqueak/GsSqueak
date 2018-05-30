resources
colorChart
	^ColorChart ifNil:
		[ColorChart := self useLargeColorPicker
			ifTrue: [ColorPickerMorph colorPaletteForDepth: 32 extent: (360+10)@(180+10)]
			ifFalse: [ColorPickerMorph colorPaletteForDepth: 16 extent: 120 @ 89]]