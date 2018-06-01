compilation
chooseNewName
	"Choose a new name for the receiver, persisting until an acceptable
	name is provided or until the existing name is resubmitted"
	| _gsSqueakTemp_oldName _gsSqueakTemp_newName |
	_gsSqueakTemp_oldName := self name.
	[_gsSqueakTemp_newName := (UIManager default request: 'Please give this Model a name' initialAnswer: _gsSqueakTemp_oldName) asSymbol.
	_gsSqueakTemp_newName = _gsSqueakTemp_oldName
		ifTrue: [^ self].
	Smalltalk includesKey: _gsSqueakTemp_newName]
		whileTrue: [self inform: 'Sorry, that name is already in use.'].
	self rename: _gsSqueakTemp_newName