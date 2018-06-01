drawing-ovals
fillOval: r color: c borderWidth: borderWidth borderColor: borderColor 
	self preserveStateDuring:
		[:inner |
		inner oval: r;
		setLinewidth: borderWidth;
		fill: c andStroke: borderColor].

	

		
