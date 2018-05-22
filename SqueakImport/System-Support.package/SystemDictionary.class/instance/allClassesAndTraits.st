classes and traits
allClassesAndTraits
	"Return all the classes and traits defined in the Smalltalk SystemDictionary"

	^Array streamContents: [ :stream |
		self allClassesAndTraitsDo: [ :each | stream nextPut: each ] ]