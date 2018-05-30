actions
submit: sendNow

	| message |

	messageText := self breakLines: self completeTheMessage atWidth: 999.
	message := MailMessage from: messageText.
	SMTPClient
			deliverMailFrom: message from 
			to: (Array with: message to) 
			text: message text 
			usingServer: self smtpServer.
	self forgetIt.
