objects from disk
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  Write a reference to a known Font in the other system instead.  "

	"A path to me"
	(TextConstants at: #forceFontWriting ifAbsent: [false]) ifTrue: [^ self].
		"special case for saving the default fonts on the disk.  See collectionFromFileNamed:"

	dp := DiskProxy global: #TTCFontDescription selector: #descriptionNamed:at:
			args: {self name. ((TTCFontDescription descriptionNamed: self name) indexOf: self)}.
	refStrm replace: self with: dp.
	^ dp.
