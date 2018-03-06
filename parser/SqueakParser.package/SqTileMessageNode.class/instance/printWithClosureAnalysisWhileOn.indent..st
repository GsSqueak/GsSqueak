printing
printWithClosureAnalysisWhileOn: aMorph indent: level 
	(arguments first isJust: NodeNil)
		ifTrue: [selector := SqSelectorNode new
						key: (selector key == #whileTrue:
								ifTrue: [#whileTrue]
								ifFalse: [#whileFalse])
						code: #macro.
			arguments := Array new].
	self
		printWithClosureAnalysisKeywords: selector key
		arguments: arguments
		on: aMorph
		indent: level