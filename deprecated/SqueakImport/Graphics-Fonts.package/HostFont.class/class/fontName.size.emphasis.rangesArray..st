instance creation
fontName: fontName size: ptSize emphasis: emphasisCode rangesArray: ranges
	"
		^HostFont fontName: (HostFont fontNameFromUser) size: 12 emphasis: 0.
	"
	^self new fontName: fontName size: ptSize emphasis: emphasisCode rangesArray: ranges