classes and traits
allTraits
	^ Array
		streamContents: [:out | self
				allTraitsDo: [:value | out nextPut: value]]