*Network-MailSending
sendMailMessage: mailMessage fromAddress: sender
	"Convenience mechanism to handle handling of receivers
	between MailMessage objects and SMTP."
	
	| mailMessageToSend recipients |
	mailMessageToSend := mailMessage deepCopy.
	recipients := (mailMessage to findTokens: ',') , 
					(mailMessage cc findTokens: ',') , 
					(mailMessage bcc findTokens: ',').
	recipients := recipients asSet collect: [:r | r withBlanksTrimmed].
	mailMessageToSend bcc: ''.
	
	self 
		mailFrom: mailMessageToSend from 
		to: recipients 
		text: mailMessageToSend asSendableText