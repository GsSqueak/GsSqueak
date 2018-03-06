testing
index
	"If index is nil, this code attempts to reconstruct the index from its
	encoding in code."
	index
		ifNotNil: [^ index].
	code < 0
		ifTrue: [^ nil].
	code > 256
		ifTrue: [self assert: index = (code \\ 256).
			^ code \\ 256].
	code
			>= (CodeBases at: self type)
		ifTrue: [self assert: index = (code
						- (CodeBases at: self type)).
			^ code
				- (CodeBases at: self type)].
	self assert: index = (code - self type).
	^ code - self type