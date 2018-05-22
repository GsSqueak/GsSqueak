building
buildFromForm: allGlyphs data: data name: aString

	| x formMetadata glyphsXStart |
	data first = 0 ifFalse: [^ self buildLimitedFromForm: allGlyphs data: data name: aString].
	formMetadata := data readStream.
	type := formMetadata next.
	pointSize := formMetadata next.
	ascent := formMetadata next.
	descent := formMetadata next.
	
	minAscii := formMetadata next.
	maxAscii := formMetadata next.
	maxWidth := formMetadata next.
	emphasis := formMetadata next.
	glyphsXStart := formMetadata upToEnd.
	name := aString.

	superscript := ascent - descent // 3.	
	subscript := descent - ascent // 3.	

	xTable := maxAscii > 1024
		ifFalse: [Array new: maxAscii + 3 withAll: 0]
		ifTrue: [ | mostCommon |
			mostCommon := glyphsXStart asBag sortedCounts first value.
			SparseLargeTable new: maxAscii + 3
			chunkSize: 256 arrayClass: Array base: 1
			defaultValue: mostCommon].
	glyphs := allGlyphs.
	x := 0.
	minAscii to: maxAscii + 1 do: [ :i |
		x := (glyphsXStart at: i - minAscii + 1).
		xTable at: i + 1 put: x].
	self reset.
	derivativeFonts := Array new: 32