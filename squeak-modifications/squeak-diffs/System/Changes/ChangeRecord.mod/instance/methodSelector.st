access
methodSelector
	^type == #method ifTrue:
		[(Smalltalk at: class ifAbsent: [Object]) newParser parseSelector: self string]