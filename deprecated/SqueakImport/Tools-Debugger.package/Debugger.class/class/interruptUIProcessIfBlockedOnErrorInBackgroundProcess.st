preferences
interruptUIProcessIfBlockedOnErrorInBackgroundProcess
	<preference: 'Interrupt UI process on background error'
		category: 'debug'
		description: 'When enabled, the debugger will interrupt the UI process if an error occurs in a background process and the UI process is blocked.'
		type: #Boolean>
	^InterruptUIProcessIfBlockedOnErrorInBackgroundProcess ifNil: [false]