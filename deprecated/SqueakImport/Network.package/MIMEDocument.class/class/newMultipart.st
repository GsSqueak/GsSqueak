instance creation
newMultipart

	| ans |
	
	ans := self new.

	ans contentTypeHeaderValue: (MIMEHeaderValue fromMIMEHeader: self contentTypeMultipartMixed).
	ans contentTypeHeaderValue parameterAt: 'boundary' put: MailMessage generateSeparator.

	^ ans