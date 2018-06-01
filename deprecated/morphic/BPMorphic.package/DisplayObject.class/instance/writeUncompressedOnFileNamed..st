fileIn/Out
writeUncompressedOnFileNamed: fileName 
	"Saves the receiver on the file fileName in the format:
	fileCode, depth, extent, offset, bits."
	| file |
	file := FileStream newFileNamed: fileName.
	file binary.
	file nextPut: 2.
	"file code = 2"
	self writeUncompressedOn: file.
	file close
	"
	| f |
	[(f := Form fromUser) boundingBox area>25] whileTrue:
	[f writeUncompressedOnFileNamed: 'test.form'.
	(Form fromBinaryStream: (FileStream oldFileNamed: 'test.form'))
	display]. "