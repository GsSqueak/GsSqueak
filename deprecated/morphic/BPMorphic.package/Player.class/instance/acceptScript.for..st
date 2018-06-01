scripts-kernel
acceptScript: aScriptEditorMorph for: aSelector 
	"Accept the tile code in the script editor as the code for the given
	selector. This branch is only for the classic-tile system, 1997-2001"
	| _gsSqueakTemp_aUniclassScript |
	self class compileSilently: aScriptEditorMorph methodString classified: 'scripts'.
	_gsSqueakTemp_aUniclassScript := self class assuredMethodInterfaceFor: aSelector asSymbol.
	_gsSqueakTemp_aUniclassScript currentScriptEditor: aScriptEditorMorph