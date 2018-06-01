message functions
removeMessage
	"If a message is selected, create a Confirmer so the user can verify that  
	the currently selected message should be removed from the system. If 
	so,  
	remove it. If the Preference 'confirmMethodRemoves' is set to false, the 
	confirmer is bypassed."
	| messageName confirmation |
	self hasMessageSelected not
		ifTrue: [^ self].
	self okToChange
		ifFalse: [^ self].
	messageName := self selectedMessageName.
	confirmation := self systemNavigation   confirmRemovalOf: messageName on: self selectedClassOrMetaClass.
	confirmation = 3
		ifTrue: [^ self].
	self selectedClassOrMetaClass removeSelector: messageName.
	self selectMessageNamed: nil.
	self changed: #messageList.
	self setClassOrganizer.
	"In case organization not cached"
	confirmation = 2
		ifTrue: [self systemNavigation browseAllCallsOn: messageName]