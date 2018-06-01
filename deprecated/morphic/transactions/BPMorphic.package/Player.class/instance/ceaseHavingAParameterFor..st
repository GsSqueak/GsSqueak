costume
ceaseHavingAParameterFor: aSelector 
	"Make the script represented by aSelector cease bearing a parameter"
	| _gsSqueakTemp_newSel |
	self renameScript: aSelector newSelector: (_gsSqueakTemp_newSel := (aSelector copyWithout: $:) asSymbol).
	(self scriptEditorFor: _gsSqueakTemp_newSel) assureParameterTilesValid; install