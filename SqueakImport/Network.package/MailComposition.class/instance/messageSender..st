access to mail object
messageSender: emailAddress

	self flag: #TODO. "add validation"
	mailMessage from: emailAddress asString.
	^ true