*SqClasses-subclass creation
variableDoubleByteSubclass: t uses: aTraitCompositionOrArray instanceVariableNames: f 
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class (the receiver) in which the subclass is to 
	have indexable 16-bit double byte-sized nonpointer variables."
	
	| newClass copyOfOldClass |
	copyOfOldClass := self copy.
	newClass := self
		variableDoubleByteSubclass: t 
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: s
		category: cat.
	
	newClass setTraitComposition: aTraitCompositionOrArray asTraitComposition.
	SystemChangeNotifier uniqueInstance
		classDefinitionChangedFrom: copyOfOldClass to: newClass.
	^newClass
