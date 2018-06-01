drawing-general
fullDrawMorph: aMorph
	(foundMorph and:[doStop]) ifTrue:[^self]. "Found it and should stop"
	aMorph == stopMorph ifTrue:[
		"Never draw the stopMorph"
		foundMorph := true.
		^self].
	^super fullDrawMorph: aMorph.