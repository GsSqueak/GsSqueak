preferences
errorReportServer
	<preference: 'Server to send error reports to'
		category: 'debug'
		description: 'When eToyFriendly is enabled, the debugger offers to send an error report to the developers of the system. This variable controls where this error report is sent to.'
		type: #String>
	^ErrorReportServer ifNil: ['']