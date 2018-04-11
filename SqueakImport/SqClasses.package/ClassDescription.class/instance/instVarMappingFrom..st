*SqClasses-private
instVarMappingFrom: oldClass
	"Return the mapping from instVars of oldClass to new class that is used for converting old instances of oldClass."
	| oldInstVarNames |
	oldInstVarNames := oldClass allInstVarNames.
	"Using #lastIndexOf: to ensure proper behavior in case where we have duplicate ivars."
	^self allInstVarNames collect: [:instVarName | oldInstVarNames lastIndexOf: instVarName].
