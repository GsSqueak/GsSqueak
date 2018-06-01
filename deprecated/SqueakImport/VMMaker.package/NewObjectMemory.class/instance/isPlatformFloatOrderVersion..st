image segment in/out
isPlatformFloatOrderVersion: imageVersion
	"Answer if floats are stored in the platform's float order for the given imageVersion.
	Prior to this version they were always in big-endian (e.g. PowerPC) format.
	The low order bit of the image format integer is set if platform float order
	is used in the image. See class ImageFormat for format number assignments."

	^imageVersion = 6505 "32-bit image"
		or: [imageVersion = 68003 "64-bit image"]