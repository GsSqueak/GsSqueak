do-its
compileSelectionFor: anObject in: evalContext 
	| _gsSqueakTemp_methodNode |
	_gsSqueakTemp_methodNode := [Compiler new
				compileNoPattern: self selectionAsStream
				in: anObject class
				context: evalContext
				environment: model environment
				notifying: self
				ifFail: [^ nil]]
				on: OutOfScopeNotification
				do: [:ex | ex resume: true].
	^ _gsSqueakTemp_methodNode generateWithTempNames