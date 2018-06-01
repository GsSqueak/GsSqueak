writing
writeNumber:aNumber base:aBase
	aBase ~= self numberDefaultBase ifTrue:[ self write:aBase; print:'r'].
	^super writeNumber:aNumber base:aBase.
