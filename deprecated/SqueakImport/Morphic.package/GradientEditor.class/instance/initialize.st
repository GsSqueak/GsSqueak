initialization
initialize
	super initialize.
	self myLayout.
	self extent: 500 @ 200.
	row := RectangleMorph new extent: self width @ 100;
				 color: Color transparent;
				 borderColor: #inset.
	row addMorph: (gradientDisplay := GradientDisplayMorph new position: 20 @ 20;
					 extent: self width - 40 @ 40).
	gradientDisplay fillStyle direction: gradientDisplay width @ 0.
	self addMorph: row.
	self addButtonRow.
	self addMorph: self colorRampExpressionMorph