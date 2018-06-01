message list
selectedMessage
	"Answer the source method for the currently selected message."

	
	self setClassAndSelectorIn: [:class :selector | | source | 
		class ifNil: [^ 'Class vanished'].
		selector first isUppercase ifTrue:
			[selector == #Comment ifTrue:
				[currentCompiledMethod := class organization commentRemoteStr.
				^ class comment].
			selector == #Definition ifTrue:
				[^ class definition].
			selector == #Hierarchy ifTrue: [^ class printHierarchy]].
		source := class sourceMethodAt: selector ifAbsent:
			[currentCompiledMethod := nil.
			^ 'Missing'].

		self showingDecompile ifTrue: [^ self decompiledSourceIntoContents].

		currentCompiledMethod := class compiledMethodAt: selector ifAbsent: [nil].
		self showingDocumentation ifTrue: [^ self commentContents].

	source := self sourceStringPrettifiedAndDiffed.
	^ source asText makeSelectorBoldIn: class]