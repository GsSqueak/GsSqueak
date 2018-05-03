*EnvironmentsEnv7-classes and traits
allClasses
	^ Array
		streamContents: [:out | self
				allClassesDo: [:class | out nextPut: class]]
