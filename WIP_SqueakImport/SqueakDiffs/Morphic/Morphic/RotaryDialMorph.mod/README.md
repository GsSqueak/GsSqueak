RotaryDialMorph is the beginnings of a suite of morphs to display values in a round dial manner. Things like pressure, speed, time, voltage etc are al well absorbed from a rotary display.

Instance Variables
	dialCenter:		<Point> - usuall the centre of the dial but consider VU meters where the pivot is pretty much at an edge.
	needleMorph:		<TransformationMorph> - wrapped around the morphs that make up the value indicating needle. This might a simple rectanglemorph, a composite like an ArrowMorph, an ImageMorph , whatever.
	startAngle:		<Number> - the start & stop angles are given in degrees from vertical up; although this causes much fun in working out the geometry it is much easier to think of a barometer going from -150 to +150 than  -4.1887902047863905 to  1.0471975511965976 radians. The stopAngle needs to be further clockwise than the startAngle. 
	startValue:		<Number> - the start & stopValues tell us what input data we must handle. It is possible to have the stopValue smaller than the startValue and effectively have the needle move backwards. This can be useful for dial where the pivot is at the top and the needle waggles around at the bottom.
	stopAngle:		<Number>
	stopValue:		<Number>
