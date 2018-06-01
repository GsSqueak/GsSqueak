instance creation
replyAllFor: aMailMessage excluding: ignoredEmailAddresses 
	
	| replySubject references replyReceivers ccReceivers |
	
	replyReceivers := MailAddressParser addressesIn: (aMailMessage fieldsNamed: 'to' separatedBy: ', ').
	replyReceivers := replyReceivers reject: [:m | 
		ignoredEmailAddresses includes: m ].
	replyReceivers addFirst: aMailMessage replyReceiver.
	
	replySubject := aMailMessage replySubject.
	references := aMailMessage references.
	
	ccReceivers := MailAddressParser addressesIn: aMailMessage cc.
	ccReceivers := ccReceivers reject: [:m |
		ignoredEmailAddresses includes: m ].

	^ self empty
		to: (replyReceivers joinSeparatedBy: ',');
		cc: (ccReceivers joinSeparatedBy: ',');
		subject: replySubject;
		setField: 'in-reply-to' toString: aMailMessage messageId;
		setField: 'references' toString: references;
		yourself
		