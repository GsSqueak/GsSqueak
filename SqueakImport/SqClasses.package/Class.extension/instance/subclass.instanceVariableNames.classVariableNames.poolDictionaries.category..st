*SqClasses-subclass creation
subclass: t instanceVariableNames: f classVariableNames: d poolDictionaries: s category: cat 
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class (the receiver)."
	
	| newClass |
	newClass := self _env0 subclassInNoDictionary: t instVarNames: f classVars: d classInstVars: (Array new) poolDictionaries: s category: cat options: (Array new).
	Smalltalk globals _env0 at: (newClass name) put: newClass.
	^ newClass.
	
	
	
