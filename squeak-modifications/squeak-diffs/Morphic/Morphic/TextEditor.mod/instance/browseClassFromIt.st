menu messages
browseClassFromIt
	"Launch a hierarchy browser for the class indicated by the current selection.  If multiple classes matching the selection exist, let the user choose among them."
	| aClass |
	self lineSelectAndEmptyCheck: [ ^ self ].
	aClass := UIManager default
		classFromPattern: self selection string withBlanksTrimmed
		withCaption: 'choose a class to browse...'
		in: model environment.
	aClass ifNil: [ ^ morph flash ].
	self systemNavigation
		spawnHierarchyForClass: aClass
		selector: nil