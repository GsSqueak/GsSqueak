become
containOnlyOops: array
	"Return true if the array contains a small integer. You 
	  can't become: SmallIntegers!"
	| fieldOffset |
	fieldOffset := self lastPointerOf: array.
	"same size as array2"
	[fieldOffset >= self baseHeaderSize] whileTrue:
		[(self isIntegerObject: (self longAt: array + fieldOffset)) ifTrue: [^ false].
		 fieldOffset := fieldOffset - self bytesPerWord].
	^true