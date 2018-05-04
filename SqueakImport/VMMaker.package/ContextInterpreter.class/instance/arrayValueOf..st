utilities
arrayValueOf: arrayOop
	"Return the address of first indexable field of resulting array object, or fail if the instance variable does not contain an indexable bytes or words object."
	"Note: May be called by translated primitive code."

	<returnTypeC: 'void *'>
	((objectMemory isIntegerObject: arrayOop) not and:
	 [objectMemory isWordsOrBytes: arrayOop])
		ifTrue: [^ objectMemory pointerForOop: (arrayOop + objectMemory baseHeaderSize)].
	self primitiveFail.
