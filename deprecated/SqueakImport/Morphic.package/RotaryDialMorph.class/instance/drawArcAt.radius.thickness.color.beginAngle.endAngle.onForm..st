dial drawing
drawArcAt: arcCenter radius: arcRadius thickness: arcThickness color: arcColor beginAngle: beginAngle endAngle: endAngle onForm: dest
"angles clockwise from North in degrees; the endAngle must be clockwise of beginAngle.
To make life more fun we then convert to anti-clockwise-from-east radians for the geometry."

	| angle lw2 stop step newPt c diff form rho cell endRho |
   
	form := Form extent: dest extent depth: 32.
	lw2 := arcThickness * 0.5.
	angle :=  (90 - endAngle) degreesToRadians.
	stop := (90 - beginAngle) degreesToRadians min: angle + Float twoPi.
	step := 0.9 / arcRadius.
	[
		rho := arcRadius - lw2 - 0.5.
		endRho := arcRadius + lw2 + 0.5.
		[rho <= endRho] whileTrue: [
			cell := (rho * angle cos) rounded  @ (rho * angle sin) rounded negated.
			newPt := arcCenter + cell.
			diff := (cell r - arcRadius) abs.
			c := diff <= lw2 ifTrue: [arcColor] ifFalse: [arcColor alpha: 1.0 - (diff - lw2)].
			form colorAt: newPt put: c.
			rho := rho + 0.5.
		].
		(angle := angle + step) <= stop
	] whileTrue.
	dest  getCanvas translucentImage: form at: 0@0.
