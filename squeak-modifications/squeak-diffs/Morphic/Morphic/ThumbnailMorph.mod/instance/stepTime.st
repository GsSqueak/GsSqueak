testing
stepTime 
	"Adjust my step time to the time it takes drawing my referent"
	drawTime ifNil:[^ 250].
	^(objectToView updateThresholdForGraphicInViewerTab * drawTime) max: 250.