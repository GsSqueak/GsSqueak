code pane menu
runUntil
	"Step until an expression evaluates to other than false, reporting an error if it doesn't evaluate to true.
	 Remember the expression in an inst var.  If shift is pressed when the expression is supplied, don't update the UI.
	 If shift is pressed while stepping, stop stepping.  Using a user interrupt to break out would be more natural
	 but Squeak currently doesn't provide a UserInterrupt expection.  It should do."
	| expression receiver context method value lastUpdate updateUI breakOnShift |
	expression := UIManager default 
					request: 'run until expression is true (shift to disable ui update; shift to break).'
					initialAnswer: (untilExpression ifNil: 'boolean expression').
	(expression isNil or: [expression isEmpty]) ifTrue:
		[^self].
	updateUI := breakOnShift := Sensor shiftPressed not.
	untilExpression := expression.
	context := self selectedContext.
	receiver := context receiver.
	method := receiver class evaluatorClass new 
				compiledMethodFor: untilExpression
				in: context
				to: receiver
				notifying: nil
				ifFail: [^ #failedDoit].

	lastUpdate := Time millisecondClockValue.
	Cursor execute showWhile:
		[[self selectedContext == context
		  and: [context willReturn not
		  and: [(value := receiver with: context executeMethod: method) == false]]] whileTrue:
			[interruptedProcess completeStep: self selectedContext.
			 self selectedContext == context ifTrue:
				[self resetContext: interruptedProcess stepToSendOrReturn changeContents: false].
			 Time millisecondClockValue - lastUpdate > 50 ifTrue:
				[updateUI ifTrue:
					[self changed: #contentsSelection.
					 Project current world displayWorldSafely].
				 breakOnShift
					ifTrue: [Sensor shiftPressed ifTrue:
								[self changed: #contentsSelection.
								 self updateInspectors.
								 ^self]]
					ifFalse: [Sensor shiftPressed ifFalse: [breakOnShift := true]].
				 lastUpdate := Time millisecondClockValue]]].
	self changed: #contentsSelection.
	self updateInspectors.
	(value ~~ false and: [value ~~ true]) ifTrue:
		[UIManager default inform: 'expression ', (untilExpression contractTo: 40), ' answered ', (value printString contractTo: 20), '!!']