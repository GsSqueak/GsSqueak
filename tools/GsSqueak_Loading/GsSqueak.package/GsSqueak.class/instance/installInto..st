installing
installInto: anEnvironment

	| classDefinitions |
	classDefinitions := self sortedClassDefinitions.
	'Install classes into GemStone'
		displayProgressFrom: 1
		to: classDefinitions size
		during: [:classBar |
			classDefinitions withIndexDo: [:classDefinition :classIndex |
				| class |
				class := classDefinition installInto: anEnvironment.
				classDefinition installBaseMethodsInto: class.
				classDefinition installExtensionMethodsInto: class categories: self categoriesToLoad.
				classBar value: classIndex]]