multibyte character methods
fixAscent: a andDescent: d head: h

	| bb newGlyphs |
	"(a + d) = (ascent + descent) ifTrue: ["
		ascent := a.
		descent := d.
		newGlyphs := Form extent: (glyphs width@(h + glyphs height)).
		bb := BitBlt toForm: newGlyphs.
		bb copy: (0@h extent: (glyphs extent)) from: 0@0 in: glyphs
			fillColor: nil rule: Form over.
		glyphs := newGlyphs.
	"]."
