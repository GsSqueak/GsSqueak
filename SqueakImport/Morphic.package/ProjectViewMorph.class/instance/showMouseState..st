events
showMouseState: anInteger 
	| aMorph |
	(owner isSystemWindow)
		ifTrue: [aMorph := owner]
		ifFalse: [aMorph := self].
	anInteger = 1
		ifTrue: ["enter"
			aMorph
				addMouseActionIndicatorsWidth: 10
				color: (Color blue alpha: 0.3)].
	anInteger = 2
		ifTrue: ["down"
			aMorph
				addMouseActionIndicatorsWidth: 15
				color: (Color blue alpha: 0.7)].
	anInteger = 3
		ifTrue: ["leave"
			aMorph deleteAnyMouseActionIndicators]