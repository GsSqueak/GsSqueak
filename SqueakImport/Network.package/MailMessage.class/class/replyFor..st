instance creation
replyFor: aMailMessage 
	
	| replyReceiver replySubject references |
	replyReceiver := aMailMessage replyReceiver.
	replySubject := aMailMessage replySubject.
	references := aMailMessage references.

	^ self empty
		to: replyReceiver;
		subject: replySubject;
		setField: 'in-reply-to' toString: aMailMessage messageId;
		setField: 'references' toString: references;
		yourself
		