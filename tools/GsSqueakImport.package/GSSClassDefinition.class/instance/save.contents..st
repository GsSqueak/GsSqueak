fileout
save: fileName contents: aString

	aString ifNil: [^ self fileDirectory deleteFileNamed: fileName].
	self fileDirectory fileNamed: fileName do: [:fileStream |
		fileStream truncate.
		fileStream nextPutAll: aString withUnixLineEndings]