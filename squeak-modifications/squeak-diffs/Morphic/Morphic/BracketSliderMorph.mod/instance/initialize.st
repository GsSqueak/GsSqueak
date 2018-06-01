initialization
initialize
	"Initialize the receiver."

	super initialize.
	self
		enabled: true;
		fillStyle: self defaultFillStyle;
		borderStyle: (BorderStyle inset baseColor: self color; width: 1);
		sliderColor: Color black;
		clipSubmorphs: true