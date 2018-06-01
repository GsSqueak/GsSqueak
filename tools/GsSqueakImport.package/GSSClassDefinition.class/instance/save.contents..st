fileout
save: fileName contents: aString

	| outFile |
	outFile := self fileDirectory fileNamed: fileName.
	outFile nextPutAll: aString.