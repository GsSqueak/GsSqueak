installing
installInto: anEnvironment

	| sortedClasses classesToInitialize |
	sortedClasses := self sortedClassDefinitions.
	classesToInitialize := OrderedCollection new.
	'Installing classes into GemStone'
		displayProgressFrom: 0
		to: sortedClasses size
		during: [:classBar |
			sortedClasses withIndexDo: [:classDefinition :classIndex |
				| class |
				class := classDefinition installInto: anEnvironment.
				classDefinition canBeSpecial ifTrue: [class setCanBeSpecial].
				classDefinition installBaseMethodsInto: class.
				classDefinition installExtensionMethodsInto: class categories: self categoriesToLoad.
				classDefinition hasInitialize ifTrue: [classesToInitialize add: class].
				"(classIndex \\ 30) = 0 ifTrue: [anEnvironment repository commitTransaction]."
				classBar value: classIndex]].
	"anEnvironment repository commitTransaction."
	self initializeClasses: classesToInitialize