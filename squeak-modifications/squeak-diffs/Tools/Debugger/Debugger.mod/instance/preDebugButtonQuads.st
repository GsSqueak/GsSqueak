initialize
preDebugButtonQuads

	^Preferences eToyFriendly
		ifTrue: [
	{
	{'Send error report' translated.	#sendReport. 	#blue. 	'send a report of the encountered problem to the Squeak developers' translated}.
	{'Abandon' translated.	#abandon. 	#black.	'abandon this execution by closing this window' translated}.
	{'Debug'	 translated.		#debug. 	#red. 	'bring up a debugger' translated}}]
		ifFalse: [
	{
	{'Proceed' translated.	#proceed. 	#blue. 	'continue execution' translated}.
	{'Abandon' translated.	#abandon. 	#black.	'abandon this execution by closing this window' translated}.
	{'Debug'	 translated.		#debug.		#red. 	'bring up a debugger' translated}}]
