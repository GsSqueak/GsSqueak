loading
loadSegments: anArray
	"Load all the source files in the given array."
	| loader |
	loader := HTTPLoader default.
	segments := anArray collect:[:name |
		| reqName request |
		reqName := (FileDirectory extensionFor: name) isEmpty
			ifTrue: [FileDirectory fileName: name extension: ImageSegment compressedFileExtension]
			ifFalse: [name].
		request := self createRequestFor: reqName in: loader.
		name->request].
