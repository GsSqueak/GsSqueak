metaclass
metaClassIndicated: trueOrFalse 
	"Indicate whether browsing instance or class messages."

	metaClassIndicated := trueOrFalse.
	self invalidateMessageCategoryDict.
	self changed: #instanceMessagesIndicated.
	self changed: #classMessagesIndicated