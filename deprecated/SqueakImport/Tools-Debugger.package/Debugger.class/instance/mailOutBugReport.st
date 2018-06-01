context stack menu
mailOutBugReport
	"Compose a useful bug report showing the state of the process as well as vital image statistics as suggested by Chris Norton - 
'Squeak could pre-fill the bug form with lots of vital, but
oft-repeated, information like what is the image version, last update
number, VM version, platform, available RAM, author...'

and address it to the list with the appropriate subject prefix."

	MailSender default ifNil: [^self].

	Cursor write
		showWhile: 
			["Prepare the message"
			| messageStrm |
			messageStrm := WriteStream on: (String new: 1500).
			messageStrm nextPutAll: 'From: ';
			 nextPutAll: MailSender userName;
			 cr;
			 nextPutAll: 'To: squeak-dev@lists.squeakfoundation.org';
			 cr;
			 nextPutAll: 'Subject: ';
			 nextPutAll: '[BUG]'; nextPutAll: self interruptedContext printString;
			 cr;cr;
			 nextPutAll: 'here insert explanation of what you were doing, suspect changes you''ve made and so forth.';cr;cr.
			self interruptedContext errorReportOn: messageStrm.

			MailSender sendMessage: (MailMessage from: messageStrm contents)].
