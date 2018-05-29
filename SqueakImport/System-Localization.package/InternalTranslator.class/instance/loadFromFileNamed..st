private store-retrieve
loadFromFileNamed: fileNameString 
	"Load translations from an external file"

	| stream |
	[stream := FileStream readOnlyFileNamed: fileNameString.
	self loadFromStream: stream]
		ensure: [stream close].
	self changed: #translations.
	self changed: #untranslated.
