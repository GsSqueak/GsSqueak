Postscript generation
remapFontForSqueak:aFontName
	self print:'/'; print:aFontName; print:' adjustFontForSqueak'; cr.
