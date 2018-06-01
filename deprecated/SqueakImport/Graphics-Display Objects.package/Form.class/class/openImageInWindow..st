file list services
openImageInWindow: fullName
	"Handle five file formats: GIF, JPG, PNG, Form storeOn: (run coded), and BMP.
	Fail if file format is not recognized."

	| image myStream |

	myStream := (FileStream readOnlyFileNamed: fullName) binary.
	[image := self fromBinaryStream: myStream.
	Project current openImage: image name: fullName saveResource: true]
		ensure: [myStream close]