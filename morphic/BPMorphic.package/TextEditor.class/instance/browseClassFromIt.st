menu messages
browseClassFromIt
	"Launch a hierarchy browser for the class indicated by the current
	selection. If multiple classes matching the selection exist, let the user
	choose among them."
	| _gsSqueakTemp_aClass |
	self
		lineSelectAndEmptyCheck: [^ self].
	_gsSqueakTemp_aClass := UIManager default
				classFromPattern: self selection string withBlanksTrimmed
				withCaption: 'choose a class to browse...'
				in: model environment.
	_gsSqueakTemp_aClass
		ifNil: [^ morph flash].
	self systemNavigation spawnHierarchyForClass: _gsSqueakTemp_aClass selector: nil