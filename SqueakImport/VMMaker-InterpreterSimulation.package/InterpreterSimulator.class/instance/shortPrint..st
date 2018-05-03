debug support
shortPrint: oop
	| name classOop |
	(objectMemory isIntegerObject: oop) ifTrue: [^ '=' , (objectMemory integerValueOf: oop) printString , 
		' (' , (objectMemory integerValueOf: oop) hex , ')'].
	classOop := objectMemory fetchClassOf: oop.
	(objectMemory sizeBitsOf: classOop) = (Metaclass instSize + 1 * bytesPerWord) ifTrue: [
		^ 'class ' , (self nameOfClass: oop)].
	name := self nameOfClass: classOop.
	name size = 0 ifTrue: [name := '??'].
	name = 'String' ifTrue: [^ (self stringOf: oop) printString].
	name = 'Symbol' ifTrue: [^ '#' , (self stringOf: oop)].
	name = 'Character' ifTrue: [^ '=' , (Character value: (objectMemory integerValueOf: 
				(objectMemory fetchPointer: 0 ofObject: oop))) printString].
	name = 'UndefinedObject' ifTrue: [^ 'nil'].
	name = 'False' ifTrue: [^ 'false'].
	name = 'True' ifTrue: [^ 'true'].
	name = 'Float' ifTrue: [self initPrimCall. ^ '=' , (self floatValueOf: oop) printString].
	name = 'Association' ifTrue: [^ '(' ,
				(self shortPrint: (objectMemory longAt: oop + objectMemory baseHeaderSize)) ,
				' -> ' ,
				(objectMemory longAt: oop + objectMemory baseHeaderSize + bytesPerWord) hex8 , ')'].
	('AEIOU' includes: name first)
		ifTrue: [^ 'an ' , name]
		ifFalse: [^ 'a ' , name]