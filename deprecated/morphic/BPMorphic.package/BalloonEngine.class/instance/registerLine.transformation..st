experimental
registerLine: aLine transformation: aMatrix 
	self
		primAddLineFrom: aLine start
		to: aLine end
		leftFillIndex: (self registerFill: aLine leftFill transform: aMatrix)
		rightFillIndex: (self registerFill: aLine rightFill transform: aMatrix)
		matrix: aMatrix