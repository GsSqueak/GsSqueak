debug support
shortPrint: oop
	| name classOop |
	(objectMemory isIntegerObject: oop) ifTrue: [^ '=' , (objectMemory integerValueOf: oop) printString , 
		' (' , (objectMemory integerValueOf: oop) hex , ')'].
	(oop between: objectMemory startOfMemory and: objectMemory freeStart) ifFalse:
		[^' is not on the heap'].
	(oop bitAnd: (objectMemory bytesPerWord - 1)) ~= 0 ifTrue:
		[^' is misaligned'].
	classOop := objectMemory fetchClassOf: oop.
	(objectMemory sizeBitsOf: classOop) = metaclassSizeBytes ifTrue: [
		^ 'class ' , (self nameOfClass: oop)].
	name := self nameOfClass: classOop.
	name size = 0 ifTrue: [name := '??'].
	name = 'String' ifTrue: [^ (self stringOf: oop) printString].
	name = 'ByteString' ifTrue: [^ (self stringOf: oop) printString].
	name = 'Symbol' ifTrue: [^ '#' , (self stringOf: oop)].
	name = 'ByteSymbol' ifTrue: [^ '#' , (self stringOf: oop)].
	name = 'Character' ifTrue: [^ '=' , (Character value: (objectMemory integerValueOf: 
				(objectMemory fetchPointer: 0 ofObject: oop))) printString].
	name = 'UndefinedObject' ifTrue: [^ 'nil'].
	name = 'False' ifTrue: [^ 'false'].
	name = 'True' ifTrue: [^ 'true'].
	name = 'Float' ifTrue: [^ '=' , (self dbgFloatValueOf: oop) printString].
	name = 'Association' ifTrue: [^ '(' ,
				(self shortPrint: (self longAt: oop + objectMemory baseHeaderSize)) ,
				' -> ' ,
				(self longAt: oop + objectMemory baseHeaderSize + objectMemory bytesPerWord) hex8 , ')'].
	('AEIOU' includes: name first)
		ifTrue: [^ 'an ' , name]
		ifFalse: [^ 'a ' , name]