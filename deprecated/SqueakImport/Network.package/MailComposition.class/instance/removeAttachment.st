actions
removeAttachment
	
	| attachmentToBeRemoved |
	
	self saveFields.
	attachmentToBeRemoved := UIManager default 
		chooseFrom: (mailMessage attachments collect: [:m | m attachmentFileName ])
		values: mailMessage attachments 
		title: 'Choose attachment to be removed' translated.
	mailMessage removeAttachment: attachmentToBeRemoved.
	self changed: #messageText.