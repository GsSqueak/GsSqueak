costume
setParameterFor: aSelector toType: aTypeSymbol 
	"Set the parameter type for the given selector"
	| _gsSqueakTemp_aUniclassScript |
	aTypeSymbol isEmptyOrNil
		ifTrue: [^ self].
	(self typeforParameterFor: aSelector)
			= aTypeSymbol
		ifTrue: [^ self].
	_gsSqueakTemp_aUniclassScript := self class scripts at: aSelector.
	_gsSqueakTemp_aUniclassScript argumentVariables first variableType: aTypeSymbol.
	_gsSqueakTemp_aUniclassScript
		currentScriptEditorDo: [:aScriptEditor | aScriptEditor assureParameterTilesValid].
	self updateAllViewersAndForceToShow: #scripts