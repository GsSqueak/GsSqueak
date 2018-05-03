debug support
lookupMethodInClass: class
	| currentClass dictionary found rclass |

	"This method overrides the interp, causing a halt on MNU."
	"true ifTrue: [^ super lookupMethodInClass: class]."    "Defeat debug support"

	currentClass := class.
	[currentClass ~= objectMemory getNilObj]
		whileTrue:
		[dictionary := objectMemory fetchPointer: MessageDictionaryIndex ofObject: currentClass.
		dictionary = objectMemory getNilObj ifTrue:
			["MethodDict pointer is nil (hopefully due a swapped out stub)
				-- raise exception #cannotInterpret:."
			objectMemory pushRemappableOop: currentClass.  "may cause GC!"
			self createActualMessageTo: class.
			currentClass := objectMemory popRemappableOop.
			messageSelector := objectMemory splObj: SelectorCannotInterpret.
			^ self lookupMethodInClass: (self superclassOf: currentClass)].

		found := self lookupMethodInDictionary: dictionary.
		found ifTrue: [^ methodClass := currentClass].
		currentClass := self superclassOf: currentClass].

	"Could not find #doesNotUnderstand: -- unrecoverable error."
	messageSelector = (objectMemory splObj: SelectorDoesNotUnderstand) ifTrue:
		[self error: 'Recursive not understood error encountered'].

self halt: (self stringOf: messageSelector).

	"Cound not find a normal message -- raise exception #doesNotUnderstand:"
	objectMemory pushRemappableOop: class.  "may cause GC!"
	self createActualMessageTo: class.
	rclass := objectMemory popRemappableOop.
	messageSelector := objectMemory splObj: SelectorDoesNotUnderstand.
	^ self lookupMethodInClass: rclass