scripts-kernel
scriptEditorFor: aSelector 
	"Answer the receiver's script editor for aSelector"
	| _gsSqueakTemp_aScriptEditor |
	_gsSqueakTemp_aScriptEditor := (self class userScriptForPlayer: self selector: aSelector)
				instantiatedScriptEditorForPlayer: self.
	_gsSqueakTemp_aScriptEditor updateToPlayer: self.
	_gsSqueakTemp_aScriptEditor bringUpToDate.
	^ _gsSqueakTemp_aScriptEditor