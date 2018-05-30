Postscript generation
setrgbcolor:aColor
	self write:aColor red; space;
		 write:aColor green; space;
		write:aColor blue; 
		print:' setrgbcolor'; cr.
