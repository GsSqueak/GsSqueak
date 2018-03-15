contents
selectedMessage
	"Answer a copy of the source code for the selected message."

	contents == nil ifFalse: [^ contents copy].

	self showingDecompile ifTrue:
		[^ self decompiledSourceIntoContents].

	"class := self selectedClassOrMetaClass.
	selector := self selectedMessageName.
	method := class compiledMethodAt: selector ifAbsent: [^ ''].	""method deleted while in another project""
	currentCompiledMethod := method."

	^ contents := (self showingDocumentation
		ifFalse: [ self sourceStringPrettifiedAndDiffed ]
		ifTrue: [ self commentContents ])
			copy asText makeSelectorBoldIn: Object