scripts-kernel
newTextualScriptorFor: aSelector 
	"Sprout a scriptor for aSelector, opening up in textual mode. Rather
	special-purpose, consult my lone sender"
	| _gsSqueakTemp_aMethodWithInterface _gsSqueakTemp_aScriptEditor |
	(self class includesSelector: aSelector)
		ifTrue: [self error: 'selector already exists'].
	_gsSqueakTemp_aMethodWithInterface := self class permanentUserScriptFor: aSelector player: self.
	_gsSqueakTemp_aScriptEditor := _gsSqueakTemp_aMethodWithInterface instantiatedScriptEditorForPlayer: self.
	_gsSqueakTemp_aScriptEditor install.
	_gsSqueakTemp_aScriptEditor showSourceInScriptor.
	_gsSqueakTemp_aMethodWithInterface selector numArgs = 0
		ifTrue: [self class
				allSubInstancesDo: [:anInst | anInst scriptInstantiationForSelector: _gsSqueakTemp_aMethodWithInterface selector]].
	"The above assures the presence of a ScriptInstantiation for the new
	selector in all siblings"
	self updateAllViewersAndForceToShow: #scripts.
	^ _gsSqueakTemp_aScriptEditor