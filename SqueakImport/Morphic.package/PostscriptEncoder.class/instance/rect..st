Postscript generation
rect: aRect

	self newpath.
	self
		moveto:aRect topLeft;
		lineto:aRect topRight x @ aRect topRight y;
		lineto:aRect bottomRight x @ aRect bottomRight y;
		lineto:aRect bottomLeft x @ aRect bottomLeft y;
		closepath.
