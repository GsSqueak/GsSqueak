initialization
initiateReplacement
	| n |
	startForm := effect = #dissolve 
				ifTrue: [(startMorph imageForm: 16 forRectangle: bounds) offset: 0 @ 0]
				ifFalse: [(startMorph imageFormForRectangle: bounds) offset: 0 @ 0].
	endForm := (endMorph imageFormForRectangle: bounds) offset: 0 @ 0.
	nSteps isNil 
		ifTrue: 
			[self nSteps: 30 stepTime: 10.
			(#(#zoom #pageForward #pageBack) includes: effect) 
				ifTrue: 
					[n := 20 * 100000 // self bounds area min: 20 max: 4.
					self nSteps: n stepTime: 10].
			#dissolve = effect 
				ifTrue: 
					[n := 20 * 50000 // self bounds area min: 20 max: 4.
					self nSteps: n stepTime: 10]].
	startBlock value.	"with forms in place there should b no further delay."
	self arrangeToStartStepping