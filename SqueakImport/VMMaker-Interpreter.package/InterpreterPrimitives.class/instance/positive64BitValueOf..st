primitive support
positive64BitValueOf: oop
	"Convert the given object into an integer value.
	The object may be either a positive ST integer or a eight-byte LargePositiveInteger."

	| sz szsqLong value  |
	<returnTypeC: 'sqLong'>
	<var: 'value' type: 'sqLong'>
	(objectMemory isIntegerObject: oop) ifTrue: [
		value := objectMemory integerValueOf: oop.
		value < 0 ifTrue: [^ self primitiveFail].
		^ value].

	self assertClassOf: oop is: (objectMemory splObj: ClassLargePositiveInteger).
	self successful ifFalse: [^ self primitiveFail].
	szsqLong := self cCode: 'sizeof(sqLong)'.
	sz := objectMemory lengthOf: oop.
	sz > szsqLong
		ifTrue: [^ self primitiveFail].
	value := 0.
	0 to: sz - 1 do: [:i |
		value := value + ((self cCoerce: (objectMemory fetchByte: i ofObject: oop) to: 'sqLong') <<  (i*8))].
	^value.