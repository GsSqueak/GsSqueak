experimental
registerBezier: aCurve transformation: aMatrix 
	self
		primAddBezierFrom: aCurve start
		to: aCurve end
		via: aCurve via
		leftFillIndex: (self registerFill: aCurve leftFill transform: aMatrix)
		rightFillIndex: (self registerFill: aCurve rightFill transform: aMatrix)
		matrix: aMatrix