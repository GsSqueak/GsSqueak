initialization
initialize

	super initialize.
	xScale := 0.25.
	yScale := 0.25.
	radiusScale := 1.0.
	lastAngle := 0.0.
	autoCenter := true.
	self form: ((Form extent: 55@55 depth: 8) fillColor: (Color r: 0.3 g: 0.2 b: 0.2)).
	handleMorph := EllipseMorph new.
	handleMorph color: Color red; extent: 15@15.
	self addMorph: handleMorph.
	self moveHandleToCenter.
	button1 := false.
	button2 := false.
