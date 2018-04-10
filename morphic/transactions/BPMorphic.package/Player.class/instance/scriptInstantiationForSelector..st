scripts-kernel
scriptInstantiationForSelector: aSelector 
	"Answer a script instantiation for the given selector, creating it at this
	time if necessary"
	| _gsSqueakTemp_entry _gsSqueakTemp_scriptDict _gsSqueakTemp_classEntry _gsSqueakTemp_actorState |
	_gsSqueakTemp_actorState := self actorState.
	_gsSqueakTemp_actorState
		ifNil: [^ nil].
	_gsSqueakTemp_scriptDict := _gsSqueakTemp_actorState instantiatedUserScriptsDictionary.
	_gsSqueakTemp_entry := _gsSqueakTemp_scriptDict
				at: aSelector
				ifAbsent: [].
	_gsSqueakTemp_entry
		ifNil: [_gsSqueakTemp_classEntry := self class userScriptForPlayer: self selector: aSelector.
			_gsSqueakTemp_entry := ScriptInstantiation new
						player: self
						selector: aSelector
						status: _gsSqueakTemp_classEntry defaultStatus.
			_gsSqueakTemp_scriptDict at: aSelector put: _gsSqueakTemp_entry].
	^ _gsSqueakTemp_entry