do-its
compileSelectionFor: anObject in: evalContext

	| methodNode |
	methodNode := [Compiler new
		compileNoPattern: self selectionAsStream
		in: anObject class
		context: evalContext
		environment: model environment
		notifying: self
		ifFail: [^nil]]
			on: OutOfScopeNotification
			do: [:ex | ex resume: true].
	^ methodNode generateWithTempNames