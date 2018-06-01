message list
removeMessage
	"If a message is selected, create a Confirmer so the user can verify that  
	the currently selected message should be removed from the system. If 
	so, remove it."
	| messageName confirmation classOrMetaClass |
	self hasMessageSelected ifFalse: [^ self].
	self okToChange ifFalse: [^ self].
	messageName := self selectedMessageName.
	classOrMetaClass := self selectedClassOrMetaClass.
	confirmation := self 
						confirmRemovalOf: messageName
						on: classOrMetaClass.
	confirmation ifFalse: [^ self].
	classOrMetaClass removeSelector: messageName.
	self invalidateMessageCategoryDict.