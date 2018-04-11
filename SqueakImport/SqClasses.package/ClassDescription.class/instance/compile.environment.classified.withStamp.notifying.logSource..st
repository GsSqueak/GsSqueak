*SqClasses-compiling
compile: text environment: anEnvironment classified: category withStamp: changeStamp notifying: requestor logSource: logSource
	| methodAndNode context methodNode |
	context := CompilationCue
		source: text
		class: self
		environment: anEnvironment
		requestor: requestor.
	methodNode := self newCompiler compile: context ifFail: [^ nil].
	methodAndNode := CompiledMethodWithNode 
		generateMethodFromNode: methodNode 
		trailer: (self defaultMethodTrailerIfLogSource: logSource).

	logSource ifTrue: [
		self logMethodSource: text forMethodWithNode: methodAndNode 
			inCategory: category withStamp: changeStamp notifying: requestor.
	].
	self addAndClassifySelector: methodAndNode selector withMethod: methodAndNode 
		method inProtocol: category notifying: requestor.
	self instanceSide noteCompilationOf: methodAndNode selector meta: self isClassSide.
	^ methodAndNode selector
