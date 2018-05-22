private-creation
fontName: fontName size: ptSize emphasis: emphasisCode rangesArray: rangesArray
	"
		^HostFont fontName: ('MS UI Gothic') size: 12 emphasis: 0 rangesArray: EFontBDFFontReaderForRanges basicNew rangesForJapanese.
	"
	| fontHandle xStart w glyphForm fontHeight fw enc rangesStream currentRange |
	fontHandle := self primitiveCreateFont: fontName size: ptSize emphasis: emphasisCode.
	fontHandle ifNil:[^nil].
	ranges := rangesArray.
	ranges ifNil: [ranges := Array with: (Array with: 0 with: 255)].
	pointSize := ptSize.
	name := fontName.
	emphasis := emphasisCode.
	minAscii := 0.
	maxAscii := ranges last last.
	ascent := self primitiveFontAscent: fontHandle.
	descent := self primitiveFontDescent: fontHandle.
	kernPairs := Array new: (self primitiveFontNumKernPairs: fontHandle).
	1 to: kernPairs size do:[:i|
		kernPairs at: i put: (self primitiveFont: fontHandle getKernPair: i)].
	fontHeight := ascent + descent.
	xTable := Array new: maxAscii + 3.
	fullWidth := Array new: maxAscii + 1.
	xStart := maxWidth := 0.
	rangesStream := ReadStream on: (ranges collect: [:e | (e first to: e second)]).
	currentRange := rangesStream next.
	0 to: maxAscii do:[:i|
		xTable at: i+1 put: xStart.
		i > currentRange last ifTrue: [
			[rangesStream atEnd not and: [currentRange := rangesStream next. currentRange last < i]] whileTrue.
			rangesStream atEnd ifTrue: [].
		].
		(currentRange includes: i) ifTrue: [
			xTable at: i+1 put: xStart.
			fw := self primitiveFont: fontHandle fullWidthOfChar: i.
			(#(	1 "anchored morph"
				9 "tab"
				10 "LF"
				13 "CR"
			) includes: i) ifTrue:[fw := {0. 0. 0}].
			fullWidth at: i+1 put: fw.
			w := fw at: 2.
			(fw at: 1) > 0 ifTrue:[w := w + (fw at: 1)].
			(fw at: 3) > 0 ifTrue:[w := w + (fw at: 3)].
			w > maxWidth ifTrue:[maxWidth := w].
			xStart := xStart + w].
		].
	xStart = 0 ifTrue:[^nil].
	strikeLength := xStart.
	xTable at: maxAscii+1 put: xStart.
	xTable at: maxAscii+2 put: xStart.
	xTable at: maxAscii+3 put: xStart.
	glyphs := Form extent: xTable last @ fontHeight depth: 1.
	glyphForm := Form extent: maxWidth @ fontHeight depth: 1.
	0 to: maxAscii do:[:i|
		glyphForm fillWhite.
		self primitiveFont: fontHandle glyphOfChar: i into: glyphForm.
		xStart := xTable at: i+1.
		glyphForm displayOn: glyphs at: xStart@0.
		"glyphForm displayOn: Display at: xStart@0."
	].
	enc := self primitiveFontEncoding: fontHandle.
	enc = 1 ifTrue:[characterToGlyphMap := self isoToSqueakMap].
	self primitiveDestroyFont: fontHandle.
	^self