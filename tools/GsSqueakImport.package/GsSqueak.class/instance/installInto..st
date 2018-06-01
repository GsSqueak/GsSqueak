installing
installInto: anEnvironment

	| sortedClasses classesToInitialize |
	sortedClasses := self sortedClassDefinitions.
	classesToInitialize := OrderedCollection new.
	'Installing classes into GemStone'
		displayProgressFrom: 0
		to: sortedClasses size
		during: [:classBar |
			UIManager default informUserDuring: [:classInfo |
				sortedClasses withIndexDo: [:classDefinition :classIndex |
					| class |
					classInfo value: classDefinition name.
					class := classDefinition installInto: anEnvironment.
					classDefinition canBeSpecial ifTrue: [class setCanBeSpecial].
					classDefinition installBaseMethodsInto: class.
					classDefinition installExtensionMethodsInto: class categories: self categoriesToLoad.
					classDefinition hasInitialize ifTrue: [classesToInitialize add: class].
					classBar value: classIndex]]].
	self initializeClasses: classesToInitialize