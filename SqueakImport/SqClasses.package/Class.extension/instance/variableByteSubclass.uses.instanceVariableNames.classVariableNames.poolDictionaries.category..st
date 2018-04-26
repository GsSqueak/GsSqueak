*SqClasses-subclass creation
variableByteSubclass: t uses: aTraitCompositionOrArray instanceVariableNames: f 
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class (the receiver) in which the subclass is to 
	have indexable 8-bit byte-sized nonpointer variables."
	
	^ self shoudBeImplemented.
