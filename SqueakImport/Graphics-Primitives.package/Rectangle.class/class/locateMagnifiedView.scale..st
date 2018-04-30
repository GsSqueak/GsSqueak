instance creation
locateMagnifiedView: aForm scale: scaleFactor
	"Answer a rectangle at the location where the scaled view of the form,
	aForm, should be displayed."

	^ self originFromUser: (aForm extent * scaleFactor + (0@50))
