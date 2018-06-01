access to mail object
messageBCC: emailAddresses

	self flag: #TODO. "add validation"
	mailMessage bcc: emailAddresses asString.
	^ true