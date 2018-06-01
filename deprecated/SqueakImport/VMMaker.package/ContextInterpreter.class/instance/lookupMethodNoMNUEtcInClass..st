alien support
lookupMethodNoMNUEtcInClass: class
	"Lookup.  Answer false on failure father than performing MNU processing etc."
	| currentClass dictionary |
	<inline: true>

	currentClass := class.
	[currentClass ~= objectMemory getNilObj] whileTrue:
		[dictionary := objectMemory fetchPointer: MessageDictionaryIndex ofObject: currentClass.
		(dictionary ~= objectMemory getNilObj
		 and: [self lookupMethodInDictionary: dictionary]) ifTrue:
			[methodClass := currentClass.
			 ^true].
		currentClass := self superclassOf: currentClass].

	^false