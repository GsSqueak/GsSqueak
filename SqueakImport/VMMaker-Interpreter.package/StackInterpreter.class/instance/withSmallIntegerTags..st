frame access
withSmallIntegerTags: value
	<inline: true>
	<var: #value type: #'char *'>
	self assert: ((self oopForPointer: value) bitAnd: objectMemory bytesPerWord - 1) = 0.
	^(self oopForPointer: value) + 1