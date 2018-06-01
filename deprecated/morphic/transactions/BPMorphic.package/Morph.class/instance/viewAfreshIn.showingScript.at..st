-Etoys-scripting
viewAfreshIn: aPasteUp showingScript: aScriptName at: aPosition 
	"Obtain a smartly updated ScriptEditor for the given script name and
	zap it into place at aPosition"
	| _gsSqueakTemp_anEditor |
	self player updateAllViewersAndForceToShow: #scripts.
	_gsSqueakTemp_anEditor := self player scriptEditorFor: aScriptName.
	aPasteUp
		ifNotNil: [aPasteUp addMorph: _gsSqueakTemp_anEditor].
	_gsSqueakTemp_anEditor position: aPosition.
	_gsSqueakTemp_anEditor currentWorld startSteppingSubmorphsOf: _gsSqueakTemp_anEditor