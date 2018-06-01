utilities
showImage: aForm named: imageName
	"Show an image, possibly attached to the pointer for positioning"

	HandMorph attach: (world drawingClass withForm: aForm)
