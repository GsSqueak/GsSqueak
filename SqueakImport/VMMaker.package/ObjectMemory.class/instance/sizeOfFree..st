header access
sizeOfFree: oop
	"Return the size of the given chunk in bytes. Argument MUST be a free chunk."
	<returnTypeC: 'usqInt'>
	^ (self longAt: oop) bitAnd: self allButTypeMask