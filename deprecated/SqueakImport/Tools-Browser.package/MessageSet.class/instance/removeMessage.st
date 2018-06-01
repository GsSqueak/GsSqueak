message functions
removeMessage
	"Remove the selected message from the system. 1/15/96 sw"
	| messageName confirmation |
	self hasMessageSelected
		ifFalse: [^ self].
	self okToChange
		ifFalse: [^ self].
	messageName := self selectedMessageName.
	confirmation := self systemNavigation  confirmRemovalOf: messageName on: self selectedClassOrMetaClass.
	confirmation = 3
		ifTrue: [^ self].
	self selectedClassOrMetaClass removeSelector: messageName.
	self deleteFromMessageList: self selection.
	self reformulateList.
	confirmation = 2
		ifTrue: [self systemNavigation browseAllCallsOn: messageName]