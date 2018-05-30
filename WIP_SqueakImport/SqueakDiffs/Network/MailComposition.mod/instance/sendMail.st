actions
sendMail

	self saveFields.
	
	[self doSendMail.
	Project current addDeferredUIMessage: [self changed: #close]] 
		forkAt: 30