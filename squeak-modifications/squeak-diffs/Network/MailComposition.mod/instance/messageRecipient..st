access to mail object
messageRecipient: emailAddresses

	self flag: #TODO. "add validation"
	mailMessage to: emailAddresses asString.
	^ true