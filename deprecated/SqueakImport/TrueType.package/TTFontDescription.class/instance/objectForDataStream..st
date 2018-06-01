copying
objectForDataStream: refStrm
	| dp isCollection |
	"I am about to be written on an object file.  Write a reference to a known Font in the other system instead.  "

	"A path to me"
	(TextConstants at: #forceFontWriting ifAbsent: [false]) ifTrue: [^ self].
		"special case for saving the default fonts on the disk.  See collectionFromFileNamed:"

	isCollection := (Descriptions detect: [:e | e == self]) isCollection.

	dp := DiskProxy global: #TTFontDescription selector: #descriptionFullNamed:at:
			args: {self fullName. (isCollection ifTrue: [(TTFontDescription descriptionFullNamed: self fullName) indexOf: self] ifFalse: [0])}.
	refStrm replace: self with: dp.
	^ dp.
