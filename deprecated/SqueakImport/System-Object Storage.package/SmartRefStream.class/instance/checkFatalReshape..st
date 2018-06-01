import image segment
checkFatalReshape: setOfClasses
	| suspects |
	"Inform the user if any of these classes were reshaped.  A block has a method from the old system whose receiver is of this class.  The method's inst var references might be wrong.  OK if inst vars were only added."

	self flag: #bobconv.	

	setOfClasses isEmpty ifTrue: [^ self].
	suspects := OrderedCollection new.
	setOfClasses do: [:aClass | | newInstVars oldInstVars bad className |
		className := renamed keyAtValue: aClass name ifAbsent: [aClass name].
		oldInstVars := (structures at: className ifAbsent: [#(0)]) allButFirst.		"should be there"
		newInstVars := aClass allInstVarNames.
		oldInstVars size > newInstVars size ifTrue: [bad := true].
		oldInstVars size = newInstVars size ifTrue: [
			bad := oldInstVars ~= newInstVars].
		oldInstVars size < newInstVars size ifTrue: [
			bad := oldInstVars ~= (newInstVars copyFrom: 1 to: oldInstVars size)].
		bad ifTrue: [suspects add: aClass]].

	suspects isEmpty ifFalse: [
		self inform: ('Imported foreign methods will run on instances of:\',
			suspects asArray printString, 
			'\whose shape has changed.  Errors may occur.') withCRs].