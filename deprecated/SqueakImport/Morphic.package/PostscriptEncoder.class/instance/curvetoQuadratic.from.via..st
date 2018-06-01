Postscript generation
curvetoQuadratic:targetPoint from:sourcePoint via:offPoint
	self write:(sourcePoint + offPoint) / 2; print:' ';
		 write:(offPoint + targetPoint) / 2; print:' ';
		 write:targetPoint;
		 print:' curveto'; cr.
