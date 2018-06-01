read write
nextAndClose
	"Speedy way to grab one object.  Only use when we are inside an object binary file.  If used for the start of a SmartRefStream mixed code-and-object file, tell the user and then do the right thing."

	| obj |
	byteStream peek = ReferenceStream versionCode "4" ifFalse: [
		"OK it is a fileIn afterall..."
		self inform: 'Should be using fileInObjectAndCode'.
		byteStream ascii.
		byteStream fileIn.
		obj := SmartRefStream scannedObject.
		SmartRefStream scannedObject: nil.
		^ obj].

	obj := self next.
	self close.
	^ obj