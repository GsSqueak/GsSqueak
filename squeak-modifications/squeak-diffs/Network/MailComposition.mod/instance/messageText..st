access to mail object
messageText: aText

	mailMessage body: ((MIMEDocument 
		contentType: MIMEDocument contentTypePlainText
		content: aText asString)
			charset: 'UTF-8';
			yourself).
	^ true