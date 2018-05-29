access to mail object
messageSubject: aSubject

	self flag: #TODO. "add validation"
	mailMessage subject: aSubject asString.
	^ true