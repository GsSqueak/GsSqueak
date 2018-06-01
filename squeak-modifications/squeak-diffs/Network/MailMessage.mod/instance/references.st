accessing
references

	^ (self hasFieldNamed: 'references')
		ifTrue: [(self fieldNamed: 'references' ifAbsent: [self error: 'Something changed the mail between the check and now']) 
					mainValue , ', ' , self messageId]
		ifFalse: [self messageId].