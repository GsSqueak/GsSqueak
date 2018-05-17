loading
loadPropertiesFrom: aDictionary

	classVars := aDictionary at: 'classvars' ifAbsent: [self classVarsMissing].
	commentStamp := aDictionary at: 'commentStamp' ifAbsent: [self commentStampMissing].
	instVars := aDictionary at: 'instvars' ifAbsent: [self instVarsMissing].
	classInstVars := aDictionary at: 'classinstvars' ifAbsent: [self classInstVarsMissing].
	name := aDictionary at: 'name' ifAbsent: [self nameMissing].
	pools := (aDictionary at: 'pools' ifAbsent: [self poolsMissing]) ifNotNil: [:array | array collect: [:each | each asSymbol]].
	type := (aDictionary at: 'type' ifAbsent: [self typeMissing]) ifNotNil: [:string | string asSymbol].
	category := aDictionary at: 'category' ifAbsent: [self categoryMissing].
	superclass := aDictionary at: 'super' ifAbsent: [self superclassMissing]