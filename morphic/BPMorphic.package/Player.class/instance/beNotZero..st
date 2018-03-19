misc
beNotZero: aNumber 
	"This is a runtime check if the arg to divide in a script is zero. If it is,
	put up a warning message. Return 0.001 instead of 0. Note the time.
	If fails again within 1 min., don't tell the user again."
	aNumber = 0
		ifFalse: [^ aNumber].
	"normal case"
	"We have a problem"
	TimeOfError
		ifNil: [TimeOfError := Time totalSeconds]
		ifNotNil: [Time totalSeconds - TimeOfError > 45
				ifTrue: [TimeOfError := Time totalSeconds.
					"in case user interrupt and reenter"
					self inform: 'Dividing by zero makes a number too
large for even a Sorcerer to handle.
Please change your script.' translated.
					TimeOfError := Time totalSeconds]].
	^ 0.001