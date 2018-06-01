processing
processCharMap: assoc
	"Process the given character map"

	| charTable glyph cmap |
	cmap := assoc value.

	assoc key = 0 ifTrue: "Unicode table"
		[charTable := SparseLargeTable new: cmap size
			chunkSize: 256 arrayClass: Array base: 1
			defaultValue: glyphs first.
		1 to: charTable size do:
			[:i |
			glyph := glyphs at: (cmap at: i) + 1 ifAbsent: [glyphs first].
			charTable at: i put: glyph].
		charTable zapDefaultOnlyEntries.
		^charTable].

	charTable := Array new: 256 withAll: glyphs first. "Initialize with default glyph"

	assoc key = 1 ifTrue: "Mac encoded table"
		[1 to: (cmap size min: charTable size) do:
			[:i |
			glyph := glyphs at: (cmap at: i) + 1.
			charTable at: (self macToWin: i) put: glyph]].

	assoc key = 3 ifTrue: "Win encoded table"
		[1 to: (cmap size min: charTable size) do:
			[:i |
			glyph := glyphs at: (cmap at: i) + 1.
			charTable at: i put: glyph]].

	^ charTable