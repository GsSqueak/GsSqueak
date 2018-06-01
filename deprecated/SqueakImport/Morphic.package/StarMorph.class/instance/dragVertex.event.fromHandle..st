editing
dragVertex: label event: evt fromHandle: handle 
	| center r1 rN rNext a1 rTotal |
	label == #outside
		ifTrue: [center := handles second center.
			r1 := center dist: vertices first.
			"Rounding and what happens as the outer handle
			approached the center, 
			requires we guard the inner radius 
			from becoming larger than the outer radius."
			rN := r1
						min: (center dist: vertices last).
			rNext := 1
						max: (center dist: evt cursorPoint).
			a1 := 270.0
						+ (center bearingToPoint: evt cursorPoint).
			rTotal := vertices size even
						ifTrue: [evt shiftPressed
								ifTrue: [rNext + rNext min: rNext + rN]
								ifFalse: [r1 + rN * rNext / r1]]
						ifFalse: [rNext + rNext].
			rNext := rTotal - rNext.
			vertices := ((a1 to: a1 + 359.999 by: 360.0 / vertices size)
						collect: [:angle | center
								+ (Point r: (rNext := rTotal - rNext) degrees: angle)]) .
			handle align: handle center with: evt cursorPoint].
	label == #center
		ifTrue: [evt shiftPressed
				ifTrue: [self updateFormFromUser]
				ifFalse: [self position: self position + (evt cursorPoint - handle center)]].
	self computeBounds