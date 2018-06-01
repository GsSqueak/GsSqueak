accessing
replyReceiver

	 ^ (self 
		fieldNamed: 'reply-to' 
		ifAbsent: [self 
			fieldNamed: 'from' 
			ifAbsent: [self error: 'there is a field missing in the original message']]) mainValue.
		