instance creation
openEditorOn: aFileStream editString: editString
	"Open an editor on the given FileStream."
	| fileModel topView builder |
	fileModel := FileList new setFileStream: aFileStream.	"closes the stream"
	builder := ToolBuilder default.
	topView := fileModel buildEditorWith: builder.
	^builder open: topView.