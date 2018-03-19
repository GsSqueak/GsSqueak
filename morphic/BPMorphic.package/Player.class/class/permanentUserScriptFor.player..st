scripts
permanentUserScriptFor: aSelector player: aPlayer 
	"Create and answer a suitable script object for the given player (who
	will be an instance of the receiver) and selector. Save that
	script-interface object in my (i.e. the class's) directory of scripts"
	| _gsSqueakTemp_entry |
	scripts
		ifNil: [scripts := IdentityDictionary new].
	_gsSqueakTemp_entry := self nascentUserScriptInstance playerClass: aPlayer class selector: aSelector.
	scripts at: aSelector put: _gsSqueakTemp_entry.
	^ _gsSqueakTemp_entry