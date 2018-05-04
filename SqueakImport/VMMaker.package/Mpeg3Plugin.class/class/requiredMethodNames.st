initialize-release
requiredMethodNames
	"answer the list of method names that should be retained for export or other support reasons"

	^#(
		checkFileEntry:		"referenced in mpeg3tValueOf"
		makeFileEntry:		"primitiveMPEG3Open, primitiveMPEG3OpenABuffer"
		removeFileEntry:	"primitiveMPEG3Close"
	)