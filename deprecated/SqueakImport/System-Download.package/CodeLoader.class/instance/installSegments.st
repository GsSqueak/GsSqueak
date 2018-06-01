installing
installSegments
	"Install the previously loaded segments"
	segments == nil ifTrue:[^self].
	segments do:[:req| self installSegment: req].
	segments := nil.