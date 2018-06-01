menu
adjustScale: evt 
	| scaleString oldScale baseValue |
	oldScale := envelope scale.
	scaleString := UIManager default request: 'Enter the new full-scale value...'
				initialAnswer: oldScale printString.
	scaleString isEmpty ifTrue: [^self].
	envelope scale: (Number readFrom: scaleString) asFloat.
	baseValue := envelope updateSelector = #pitch: ifTrue: [0.5] ifFalse: [0.0].
	envelope 
		setPoints: (envelope points collect: 
					[:p | 
					p x @ ((p y - baseValue) * oldScale / envelope scale + baseValue min: 1.0
								max: 0.0)])
		loopStart: (limits first)
		loopEnd: (limits second).
	self buildView