misc
newFrom: aSimilarObject
	"Must copy the urlObject, so they won't be shared"

	| inst |
	inst := super newFrom: aSimilarObject.
	inst urlObject: aSimilarObject urlObject copy.
	^ inst