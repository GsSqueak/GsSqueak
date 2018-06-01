toolbuilder
preDebugMessageString
	^ message ifNil: [
			String streamContents: [:s | 
				s nextPutAll: 'An error has occurred, sorry! You could send the Squeak developers an error report or just hit ''Abandon''.

In the error report, there is no personal information, only information that we can use to investigate the error. If you decide to send us the error report, it will include the following text:

' translated.
				[s nextPutAll: self contextStackTop printString; cr.
				self contextStackTop errorReportOn: s] on: Error do: [s nextPutAll: 'no text, there was an error creating the error report' translated]]].