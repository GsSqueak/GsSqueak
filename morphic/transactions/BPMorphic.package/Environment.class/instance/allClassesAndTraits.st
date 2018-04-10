classes and traits
allClassesAndTraits
	^ Array
		streamContents: [:out | self
				allClassesAndTraitsDo: [:value | out nextPut: value]]