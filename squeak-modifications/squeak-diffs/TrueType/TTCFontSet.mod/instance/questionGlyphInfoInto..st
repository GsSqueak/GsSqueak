private
questionGlyphInfoInto: glyphInfoArray
"return glyph info for the question mark character in the first font of the fontArray -sort of a default set of info"
	| f form |
	f := fontArray at: 1.
	form := f formOf: $?.
	glyphInfoArray at: 1 put: form;
		at: 2 put: 0;
		at: 3 put: form width;
		at: 4 put: (self ascentOf: $?);
		at: 5 put: self.
	^ glyphInfoArray.
