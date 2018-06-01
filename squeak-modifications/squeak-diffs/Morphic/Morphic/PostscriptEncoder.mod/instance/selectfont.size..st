Postscript generation
selectfont:fontname size:size
	self print:'/'; print:fontname; space; write:size; print:' selectfont'; cr.
