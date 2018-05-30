private
computeForm: char
	"Compute the glyph form for the given character"
	^ttcDescription renderGlyph: char height: self height fgColor: foregroundColor bgColor: Color transparent depth: self depth