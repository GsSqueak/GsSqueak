validation
validateInstvars: instVarArray from: oldClass forSuper: newSuper
	"Check if any of the instVars of oldClass conflict with the new superclass"
	| instVars usedNames temp |
	instVarArray isEmpty ifTrue:[^true]. "Okay"
	newSuper allowsSubInstVars ifFalse: [
		self error: newSuper printString, ' does not allow subclass inst vars. See allowsSubInstVars.'. ^ false].

	"Validate the inst var names"
	usedNames := instVarArray asSet.
	usedNames size = instVarArray size 
		ifFalse:[	instVarArray do:[:var|
					usedNames remove: var ifAbsent:[temp := var]].
				self error: temp,' is multiply defined'. ^false].
	(usedNames includesAnyOf: self reservedNames) 
		ifTrue:[	self reservedNames do:[:var|
					(usedNames includes: var) ifTrue:[temp := var]].
				self error: temp,' is a reserved name'. ^false].

	newSuper == nil ifFalse:[
		usedNames := newSuper allInstVarNames asSet.
		instVarArray do:[:iv|
			(usedNames includes: iv) ifTrue:[
				newSuper withAllSuperclassesDo:[:cl|
					(cl instVarNames includes: iv) ifTrue:[temp := cl]].
				(DuplicateVariableError new)
					superclass: temp;
					variable: iv;
					signal: iv,' is already defined in ', temp name]]].
	oldClass == nil ifFalse:[
		usedNames := Set new: 20.
		oldClass allSubclassesDo:[:cl| usedNames addAll: cl instVarNames].
		instVars := instVarArray.
		newSuper == nil ifFalse:[instVars := instVars, newSuper allInstVarNames].
		instVars do:[:iv|
			(usedNames includes: iv) ifTrue:[
				(DuplicateVariableError new)
					superclass: oldClass;
					variable: iv;
					signal: iv,' is already defined in a subclass of ', temp name]]].
	^true