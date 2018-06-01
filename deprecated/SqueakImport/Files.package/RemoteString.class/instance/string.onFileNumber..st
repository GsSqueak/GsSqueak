private
string: aString onFileNumber: fileNumber
	"Store this as my string if source files exist."
	(SourceFiles at: fileNumber) ifNotNil: [:theFile |
		theFile isReadOnly ifTrue: [^ nil].
		theFile setToEnd; cr.
		self string: aString onFileNumber: fileNumber toFile: theFile].