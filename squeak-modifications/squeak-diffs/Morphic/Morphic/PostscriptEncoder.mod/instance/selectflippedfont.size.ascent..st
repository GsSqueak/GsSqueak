Postscript generation
selectflippedfont:fontname size:size ascent:ascent
	self print:'/'; print:fontname; space; 
		print:'[ '; write:size; print:' 0 0 ';write:size negated; print:' 0 '; write:ascent; print:'] selectfont'; cr.

