scripts-kernel
renameScript: oldSelector 
	"The user has asked to rename the script formerly known by
	oldSelector; obtain a new selector from the user, check it out, and if
	all is well, ascribe the new name as appropriate"
	| _gsSqueakTemp_reply _gsSqueakTemp_newSelector _gsSqueakTemp_aUserScript |
	self flag: #deferred.
	"Relax the restriction below, before too long"
	_gsSqueakTemp_aUserScript := self class userScriptForPlayer: self selector: oldSelector.
	_gsSqueakTemp_aUserScript okayToRename
		ifFalse: [self inform: 'Sorry, we do not permit you to rename
classic-tiled scripts that are currently
textually coded.  Go back to tile scripts
and try again.  Humble apologies.' translated.
			^ self].
	_gsSqueakTemp_reply := UIManager default request: 'Script Name' translated initialAnswer: oldSelector.
	_gsSqueakTemp_reply isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_reply = oldSelector
		ifTrue: [^ Beeper beep].
	_gsSqueakTemp_newSelector := self acceptableScriptNameFrom: _gsSqueakTemp_reply forScriptCurrentlyNamed: oldSelector.
	Preferences universalTiles
		ifTrue: ["allow colons"
			(_gsSqueakTemp_reply copyWithout: $:)
					= _gsSqueakTemp_newSelector
				ifTrue: [_gsSqueakTemp_newSelector := _gsSqueakTemp_reply asSymbol]
				ifFalse: [self inform: 'name will be modified']].
	self renameScript: oldSelector newSelector: _gsSqueakTemp_newSelector