header access
isMarked: oop
	<api>
	"Answer if oop's mark bit is set"
	^((self longAt: oop) bitAnd: self markBit) ~= 0