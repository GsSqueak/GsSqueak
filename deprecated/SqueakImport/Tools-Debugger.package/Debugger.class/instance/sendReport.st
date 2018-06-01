notifier menu
sendReport
	[| errorReport |
	errorReport := String streamContents: [:s |
		s nextPutAll: self contextStackTop printString; cr.
		self contextStackTop errorReportOn: s].
	(Smalltalk classNamed: #WebClient)
		ifNotNil: [:wc |
			wc
				httpPost: self class errorReportServer
				content: errorReport
				type: 'text/plain']] on: Error do: ["nothing"].
	self abandon.