reformulation
reformulateList
	"Reformulate the message list of the receiver"

	self initializeMessageList: (changeSet changedMessageListAugmented select: 
		[:each | each isValid])
