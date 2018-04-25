*SqClasses-subclass creation
variableByteSubclass: t instanceVariableNames: f 
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class (the receiver) in which the subclass is to 
	have indexable 8-bit byte-sized nonpointer variables."
	| newClass old |
	old := Smalltalk globals _env0 at: (t asSymbol) ifAbsent: [nil].
	newClass := self _env0 byteSubclassInNoDictionary: t instVarNames: f  classVars: d classInstVars: (Array new) poolDictionaries: s  newVersionOf: old description: nil options: (Array new).
	Smalltalk globals _env0 at: (newClass name) put: newClass.
	^ newClass.
