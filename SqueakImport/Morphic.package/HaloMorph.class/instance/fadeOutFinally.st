stepping
fadeOutFinally
	self magicAlpha <= 0.05 ifTrue:[^super delete].
	self magicAlpha <= 0.3 ifTrue:[
		^self magicAlpha: (self magicAlpha - 0.03 max: 0.0)].
	self magicAlpha: ((self magicAlpha * 0.5) max: 0.0)
