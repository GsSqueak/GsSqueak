accessing
replySubject

	 ^ (self subject asLowercase beginsWith: 're:')
		ifTrue: [self subject]
		ifFalse: ['Re: ' , self subject].