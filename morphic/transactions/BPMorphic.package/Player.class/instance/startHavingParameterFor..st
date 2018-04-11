costume
startHavingParameterFor: aSelector 
	"Start having a parameter for the given selector. After this change, the
	script name will change by the addition of a colon."
	| _gsSqueakTemp_newSelector |
	self renameScript: aSelector newSelector: (_gsSqueakTemp_newSelector := (aSelector , ':') asSymbol).
	(self scriptEditorFor: _gsSqueakTemp_newSelector) install