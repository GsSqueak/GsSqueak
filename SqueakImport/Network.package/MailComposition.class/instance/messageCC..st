access to mail object
messageCC: emailAddresses

	self flag: #TODO. "add validation"
	mailMessage cc: emailAddresses asString.
	^ true