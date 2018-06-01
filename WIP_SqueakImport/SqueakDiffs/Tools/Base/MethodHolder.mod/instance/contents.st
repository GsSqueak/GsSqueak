contents
contents
	"Answer the contents, with due respect for my contentsSymbol"

	contents := methodClass sourceCodeAt: methodSelector ifAbsent: [''].
	currentCompiledMethod := methodClass compiledMethodAt: methodSelector ifAbsent: [nil].

	self showingDecompile ifTrue: [^ self decompiledSourceIntoContents].
	self showingDocumentation ifTrue: [^ self commentContents].
	^ contents := self sourceStringPrettifiedAndDiffed asText makeSelectorBoldIn: methodClass