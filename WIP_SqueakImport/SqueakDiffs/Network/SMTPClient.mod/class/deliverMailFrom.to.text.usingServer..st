sending mail
deliverMailFrom: fromAddress to: recipientList text: messageText usingServer: serverName
	"Deliver a single email to a list of users and then close the connection.  For delivering multiple messages, it is best to create a single connection and send all mail over it.  NOTE: the recipient list should be a collection of simple internet style addresses -- no '<>' or '()' stuff"

	| smtpClient |
	smtpClient := self openOnHostNamed: serverName.
	[smtpClient mailFrom: fromAddress to: recipientList text: messageText.
	smtpClient quit]
		ensure: [smtpClient close]
