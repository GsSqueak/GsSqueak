model protocol
release

	self dependents do:
		[:view | (view isMorph and: [view isInWorld not])
					ifTrue: [self removeDependent: view]]