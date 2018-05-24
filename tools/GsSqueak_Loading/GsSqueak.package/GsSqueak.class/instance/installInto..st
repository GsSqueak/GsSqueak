installing
installInto: anEnvironment

	| classDefinitions |
	classDefinitions := self sortedClassDefinitions.
	'Install classes into GemStone'
		displayProgressFrom: 1
		to: classDefinitions size
		during: [:classBar |
			classDefinitions withIndexDo: [:classDefinition :classIndex |
				classDefinition installInto: anEnvironment.
				classBar value: classIndex]]