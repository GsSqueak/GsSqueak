object access
arrayValueOf: oop 
	"Return the address of first indexable field of resulting array object, or
	fail if the instance variable does not contain an indexable bytes or
	words object."
	"Note: May be called by translated primitive code."
	<returnTypeC: 'void *'>
	self
		success: (self isWordsOrBytes: oop).
	^ CArrayAccessor on: oop