regression test
regressionTestFrom: fd
	"ZipWriteStream regressionTestFrom: FileDirectory default"
	"ZipWriteStream regressionTestFrom: (FileDirectory on:'')"
	"ZipWriteStream regressionTestFrom: (FileDirectory on:'C:')"
	| tempName stats |
	Transcript clear.
	stats := Dictionary new.
	tempName := FileDirectory default fullNameFor: '$$sqcompress$$'.
	FileDirectory default deleteFileNamed: tempName.
	self regressionTestFrom: fd using: tempName stats: stats.