query
allUnSentMessagesIn: selectorSet 
	"Answer the subset of selectorSet which are not sent anywhere in the 
	system. "
	^ selectorSet copyWithoutAll: self allSentMessages