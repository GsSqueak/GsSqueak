initialization
initialize

	super initialize.
	
	self beSplitsLeftAndRight.
	
	leftOrTop := OrderedCollection new.
	rightOrBottom := OrderedCollection new.
	
	Preferences showSplitterHandles 
		ifTrue: [
			handle := CircleMorph new
					borderWidth: 0;
					extent: 4@4;
					yourself.
			handle fillStyle: ((GradientFillStyle 
						ramp: {0.0 -> Color veryVeryLightGray muchLighter. 
							1.0 -> Color veryVeryLightGray darker})
						origin: handle topLeft;
						direction: 0 @ handle bounds extent y;
						normal: handle bounds extent x @ 0;
						radial: false;
						yourself).
			self addMorphCentered: handle].
	self initializeMovements