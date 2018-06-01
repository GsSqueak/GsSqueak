filtering
filterToUnsentMessages
	"Filter the receiver's list down to only those items which have no  
	senders"
	self
		filterFrom: [:aClass :aSelector | (self systemNavigation allCallsOn: aSelector) isEmpty]