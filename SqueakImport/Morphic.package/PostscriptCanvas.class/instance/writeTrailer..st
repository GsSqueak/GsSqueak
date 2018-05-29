morph drawing
writeTrailer: somePages 
	target
		print: '%%Trailer';
		cr.
	usedFonts isEmpty 
		ifFalse: 
			[target print: '%%DocumentFonts:'.
			usedFonts values asSet do: 
					[:f | 
					target
						space;
						print: f].
			target cr].
	target print:'%%Pages: '; write: somePages; cr.
	target
		print: '%%EOF';
		cr