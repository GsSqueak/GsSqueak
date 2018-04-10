server list
removeServer
	| _gsSqueakTemp_choice _gsSqueakTemp_names |
	self flag: #ViolateNonReferenceToOtherClasses.
	_gsSqueakTemp_names := ServerDirectory serverNames.
	_gsSqueakTemp_choice := UIManager default chooseFrom: _gsSqueakTemp_names values: _gsSqueakTemp_names.
	_gsSqueakTemp_choice == nil
		ifTrue: [^ self].
	ServerDirectory removeServerNamed: _gsSqueakTemp_choice