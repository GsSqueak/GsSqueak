initialize
initializeString
	| xStart char glyph |
	(font isNil or: [string isNil]) ifTrue: [^ self].
	xStart := 0.
	ttBounds := 0@0 corner: 0@0.
	1 to: string size do:
		[:i |
		char := string at: i.
		glyph := font at: char.
		ttBounds := ttBounds quickMerge: (glyph bounds translateBy: xStart@0).
		xStart := xStart + glyph advanceWidth.
	].
	self extent: ttBounds extent // 40.
	borderWidth := ttBounds height // 40