subclass creation
variableDoubleByteSubclass: t instanceVariableNames: f 
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class (the receiver) in which the subclass is to 
	have indexable 16-bit double byte-sized nonpointer variables."
	| newClass old |
	old := Smalltalk globals _env0 at: (t asSymbol) ifAbsent: [nil].
	newClass := self _env0 byteSubclassInNoDictionary: t instVarNames: (self asArrayParam: f)  classVars: (self asArrayParam: d) classInstVars: #() poolDictionaries: (self asArrayParam: s) category: cat newVersionOf: old description: nil options: #(#'2byteWords').
	Smalltalk globals _env0 at: (newClass name) put: newClass.
	^ newClass.
