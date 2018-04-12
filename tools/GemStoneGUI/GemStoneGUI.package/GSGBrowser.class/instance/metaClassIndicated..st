metaclass
metaClassIndicated: trueOrFalse 
	"Indicate whether browsing instance or class messages."

	self okToChange ifFalse: [^ self].
	metaClassIndicated := trueOrFalse.
	self invalidateMessageCategoryDict.
	self changed: #instanceMessagesIndicated.
	self changed: #classMessagesIndicated