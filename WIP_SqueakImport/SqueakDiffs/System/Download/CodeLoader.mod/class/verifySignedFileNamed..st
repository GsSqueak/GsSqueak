utilities
verifySignedFileNamed: aFileName
	"CodeLoader verifySignedFileNamed: 'signed\dummy1.dsq' "

	| secured signedFileStream |
	signedFileStream := FileStream fileNamed: aFileName.
	secured := SecurityManager default positionToSecureContentsOf: signedFileStream.
	signedFileStream close.
	Transcript show: aFileName , ' verified: '; show: secured printString; cr.

