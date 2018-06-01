own services
importImage
	"Import the given image file and store the resulting Form in the default Imports"

	| fname image |
	fname := fileName sansPeriodSuffix.
	image := Form fromFileNamed: self fullName.
	Imports default importImage: image named: fname.
