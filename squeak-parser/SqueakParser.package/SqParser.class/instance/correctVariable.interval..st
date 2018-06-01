error correction
correctVariable: proposedVariable interval: spot 
	"Correct the proposedVariable to a known variable, or declare it as a
	new variable if such action is requested. We support declaring
	lowercase variables as temps or inst-vars, and uppercase variables as
	Globals or 
	ClassVars, depending on whether the context is nil
	(class=UndefinedObject). Spot is the interval within the test stream of
	the variable.
	rr 3/4/2004 10:26 : adds the option to define a new class."
	"Check if this is an i-var, that has been corrected already (ugly)"
	"Display the pop-up menu"
	| userSelection action |
	(encoder classEncoding instVarNames includes: proposedVariable)
		ifTrue: [^ SqInstanceVariableNode new
				name: proposedVariable
				index: (encoder classEncoding allInstVarNames indexOf: proposedVariable)].
	"First check to see if the requestor knows anything about the variable"
	(cue requestor
		ifNotNil: [:object | object bindingOf: proposedVariable])
		ifNotNil: [:binding | ^ encoder global: binding name: proposedVariable].
	"If we can't ask the user for correction, make it undeclared"
	self interactive
		ifFalse: [^ encoder undeclared: proposedVariable].
	userSelection := cue requestor selectionInterval.
	cue requestor selectFrom: spot first to: spot last.
	cue requestor select.
	"Build the menu with alternatives"
	action := UndeclaredVariable
				signalFor: self
				name: proposedVariable
				inRange: spot.
	action
		ifNil: [^ self fail].
	"Execute the selected action"
	cue requestor deselect.
	cue requestor selectInvisiblyFrom: userSelection first to: userSelection last.
	^ action value