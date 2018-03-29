simulation
shortPrint: oop 
	| _gsSqueakTemp_name _gsSqueakTemp_classOop _gsSqueakTemp_key |
	(objectMemory isImmediate: oop)
		ifTrue: [(objectMemory isImmediateCharacter: oop)
				ifTrue: [^ (objectMemory characterValueOf: oop)
							< 256
						ifTrue: ['=$' , (objectMemory characterValueOf: oop) printString , ' ($'
								, (String
										with: (Character
												value: (objectMemory characterValueOf: oop))) , ')']
						ifFalse: ['=$' , (objectMemory characterValueOf: oop) printString , '($???)']].
			(objectMemory isIntegerObject: oop)
				ifTrue: [^ '=' , (objectMemory integerValueOf: oop) printString , ' (' , (objectMemory integerValueOf: oop) hex , ')'].
			(objectMemory isImmediateFloat: oop)
				ifTrue: [^ '=' , (objectMemory floatValueOf: oop) printString , ' (' , oop hex , ')'].
			^ '= UNKNOWN IMMEDIATE' , ' (' , (objectMemory integerValueOf: oop) hex , ')'].
	(objectMemory addressCouldBeObj: oop)
		ifFalse: [^ (oop bitAnd: objectMemory allocationUnit - 1)
					~= 0
				ifTrue: [' is misaligned']
				ifFalse: [self whereIs: oop]].
	(objectMemory isFreeObject: oop)
		ifTrue: [^ ' is a free chunk of size ' , (objectMemory sizeOfFree: oop) printString
				, (objectMemory hasSpurMemoryManagerAPI
						ifTrue: [' 0th: ' , (objectMemory fetchPointer: 0 ofFreeChunk: oop) hex]
						ifFalse: [''])].
	(objectMemory isForwarded: oop)
		ifTrue: [^ ' is a forwarded object to ' , (objectMemory followForwarded: oop) hex , ' of slot size ' , (objectMemory numSlotsOfAny: oop) printString].
	(objectMemory isFloatInstance: oop)
		ifTrue: [^ '=' , (objectMemory dbgFloatValueOf: oop) printString].
	oop = objectMemory nilObject
		ifTrue: [^ 'nil'].
	oop = objectMemory falseObject
		ifTrue: [^ 'false'].
	oop = objectMemory trueObject
		ifTrue: [^ 'true'].
	_gsSqueakTemp_classOop := objectMemory fetchClassOfNonImm: oop.
	((self objCouldBeClassObj: oop)
			and: [(objectMemory numSlotsOf: _gsSqueakTemp_classOop)
					= metaclassNumSlots])
		ifTrue: [^ 'class '
				, (self nameOfClass: oop)].
	_gsSqueakTemp_name := self nameOfClass: _gsSqueakTemp_classOop.
	_gsSqueakTemp_name size = 0
		ifTrue: [_gsSqueakTemp_name := '??'].
	(#('String' 'ByteString') includes: _gsSqueakTemp_name)
		ifTrue: [^ (self stringOf: oop) printString].
	(#('Symbol' 'ByteSymbol') includes: _gsSqueakTemp_name)
		ifTrue: [^ '#'
				, (self stringOf: oop)].
	_gsSqueakTemp_name = 'Character'
		ifTrue: ["SpurMemoryManager has immediate Characters (see above);
			ObjectMemory does not"
			^ '=' , (Character
					value: (objectMemory
							integerValueOf: (objectMemory fetchPointer: 0 ofObject: oop))) printString].
	"Try to spot association-like things; they're all subclasses of LookupKey"
	((objectMemory isPointersNonImm: oop)
			and: [_gsSqueakTemp_classOop ~= objectMemory nilObject
					and: [((objectMemory instanceSizeOf: _gsSqueakTemp_classOop)
								between: ValueIndex + 1
								and: ValueIndex + 2)
							and: [(objectMemory addressCouldBeObj: (_gsSqueakTemp_key := objectMemory fetchPointer: KeyIndex ofObject: oop))
									and: [(_gsSqueakTemp_key = objectMemory nilObject
												and: [self
														addressCouldBeClassObj: (objectMemory fetchPointer: ValueIndex ofObject: oop)])
											or: [objectMemory isBytesNonImm: _gsSqueakTemp_key]]]]])
		ifTrue: [| classLookupKey |
			classLookupKey := objectMemory
						fetchClassOfNonImm: (objectMemory splObj: SchedulerAssociation).
			[classLookupKey = objectMemory nilObject
				ifTrue: [^ (('AEIOU' includes: _gsSqueakTemp_name first)
						ifTrue: ['an ']
						ifFalse: ['a '])
						, _gsSqueakTemp_name].
			(objectMemory instanceSizeOf: classLookupKey)
				= (KeyIndex + 1)]
				whileFalse: [classLookupKey := self superclassOf: classLookupKey].
			[(objectMemory
				instanceSizeOf: (self superclassOf: classLookupKey))
				= (KeyIndex + 1)]
				whileTrue: [classLookupKey := self superclassOf: classLookupKey].
			(self includesBehavior: _gsSqueakTemp_classOop ThatOf: classLookupKey)
				ifTrue: [^ (('AEIOU' includes: _gsSqueakTemp_name first)
						ifTrue: ['an ']
						ifFalse: ['a '])
						, _gsSqueakTemp_name , ' '
						, (self
								shortPrint: (objectMemory fetchPointer: KeyIndex ofObject: oop)) , ' -> ' , (objectMemory fetchPointer: ValueIndex ofObject: oop) hex8]].
	^ (('AEIOU' includes: _gsSqueakTemp_name first)
		ifTrue: ['an ']
		ifFalse: ['a '])
		, _gsSqueakTemp_name