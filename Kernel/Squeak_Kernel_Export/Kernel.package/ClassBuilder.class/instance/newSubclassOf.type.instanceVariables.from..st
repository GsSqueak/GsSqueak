class definition
newSubclassOf: newSuper type: type instanceVariables: instVars from: oldClass
	"Create a new subclass of the given superclass with the given specification."
	| newFormat newClass |
	"Compute the format of the new class"
	newFormat := self computeFormat: type instSize: instVars size forSuper: newSuper.

	newFormat ifNil: [^nil].

	(oldClass == nil or:[oldClass isMeta not]) 
		ifTrue:[newClass := self privateNewSubclassOf: newSuper from: oldClass]
		ifFalse:[newClass := oldClass clone].

	newClass 
		superclass: newSuper
		methodDictionary: (oldClass ifNil: [MethodDictionary new] ifNotNil: [oldClass methodDict copy])
		format: newFormat;
		setInstVarNames: instVars.

	oldClass ifNotNil:[
		newClass organization: oldClass organization.
		"Recompile the new class"
		oldClass hasMethods 
			ifTrue:[newClass compileAllFrom: oldClass].

		oldClass hasTraitComposition ifTrue: [
			newClass setTraitComposition: oldClass traitComposition copyTraitExpression ].
		oldClass class hasTraitComposition ifTrue: [
			newClass class setTraitComposition: oldClass class traitComposition copyTraitExpression ].
		
		self recordClass: oldClass replacedBy: newClass.
	].

	(oldClass == nil or:[oldClass isObsolete not]) 
		ifTrue:[newSuper addSubclass: newClass]
		ifFalse:[newSuper addObsoleteSubclass: newClass].

	^newClass