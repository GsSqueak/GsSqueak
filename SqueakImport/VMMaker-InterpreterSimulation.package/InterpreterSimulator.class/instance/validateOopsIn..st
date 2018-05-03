testing
validateOopsIn: object
	| fieldPtr limit former header | 
	"for each oop in me see if it is legal"
	fieldPtr := object + objectMemory baseHeaderSize.	"first field"
	limit := object + (objectMemory lastPointerOf: object).	"a good field"
	[fieldPtr > limit] whileFalse: [
		former := objectMemory longAt: fieldPtr.
		(self validOop: former) ifFalse: [self error: 'invalid oop in pointers object'].
		fieldPtr := fieldPtr + bytesPerWord].
	"class"
	header := objectMemory baseHeader: object.
	(header bitAnd: CompactClassMask) = 0 ifTrue: [	
		former := (objectMemory classHeader: object) bitAnd: objectMemory allButTypeMask.
		(self validOop: former) ifFalse: [self halt]].