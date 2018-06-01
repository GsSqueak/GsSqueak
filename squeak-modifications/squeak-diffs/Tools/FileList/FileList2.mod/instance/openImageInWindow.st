own services
openImageInWindow
	"Handle five file formats: GIF, JPG, PNG, Form stoteOn: (run coded), and BMP.
	Fail if file format is not recognized."

	| image myStream |
	myStream := (directory readOnlyFileNamed: fileName) binary.
	[image := Form fromBinaryStream: myStream.
	Project current openImage: image name: fileName saveResource: false]
		ensure: [myStream close]
