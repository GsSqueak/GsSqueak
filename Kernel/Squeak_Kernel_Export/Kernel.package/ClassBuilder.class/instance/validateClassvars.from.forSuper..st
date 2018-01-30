validation
validateClassvars: classVarArray from: oldClass forSuper: newSuper
	"Check if any of the classVars of oldClass conflict with the new superclass"
	| usedNames classVars temp |
	classVarArray isEmpty ifTrue:[^true]. "Okay"

	"Validate the class var names"
	usedNames := classVarArray asSet.
	usedNames size = classVarArray size 
		ifFalse:[	classVarArray do:[:var|
					usedNames remove: var ifAbsent:[temp := var]].
				self error: temp,' is multiply defined'. ^false].
	(usedNames includesAnyOf: self reservedNames) 
		ifTrue:[	self reservedNames do:[:var|
					(usedNames includes: var) ifTrue:[temp := var]].
				self error: temp,' is a reserved name'. ^false].

	newSuper == nil ifFalse:[
		usedNames := newSuper allClassVarNames asSet.
		classVarArray do:[:iv|
			(usedNames includes: iv) ifTrue:[
				newSuper withAllSuperclassesDo:[:cl|
					(cl classVarNames includes: iv) ifTrue:[temp := cl]].
				(DuplicateVariableError new)
					superclass: temp;
					variable: iv;
					signal: iv,' is already defined in ', temp name]]].

	oldClass == nil ifFalse:[
		usedNames := Set new: 20.
		oldClass allSubclassesDo:[:cl| usedNames addAll: cl classVarNames].
		classVars := classVarArray.
		newSuper == nil ifFalse:[classVars := classVars, newSuper allClassVarNames asArray].
		classVars do:[:iv|
			(usedNames includes: iv) ifTrue:[
				(DuplicateVariableError new)
					superclass: oldClass;
					variable: iv;
					signal: iv, ' is already defined in a subclass of ', oldClass name]]].
	^true