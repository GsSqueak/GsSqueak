Postscript generation
oval: aPoint
	self print: 'matrix currentmatrix'; cr;
		write: (aPoint extent // 2); space;
		write: aPoint topLeft;
		print: ' newpath translate scale 1 1 1 0 360 arc setmatrix'; cr
