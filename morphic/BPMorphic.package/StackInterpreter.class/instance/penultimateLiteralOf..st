debug printing
penultimateLiteralOf: aMethodOop 
	self
		assert: (objectMemory isOopCompiledMethod: aMethodOop).
	^ self literal: (objectMemory literalCountOf: aMethodOop)
			- 2 ofMethod: aMethodOop