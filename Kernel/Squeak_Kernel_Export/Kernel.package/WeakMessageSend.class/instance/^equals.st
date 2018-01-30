comparing
= anObject
	"Compare equal to equivalent MessageSend"
	^ anObject isMessageSend
		and: [self receiver == anObject receiver
		and: [selector == anObject selector
		and: [(Array withAll: self arguments) = (Array withAll: anObject arguments)]]]
