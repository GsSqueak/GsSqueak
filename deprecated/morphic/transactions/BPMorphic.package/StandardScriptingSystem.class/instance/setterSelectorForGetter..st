-Etoys-utilities
setterSelectorForGetter: aGetterSymbol 
	"Answer the setter selector corresponding to a given getter"
	^ ('s'
		, (aGetterSymbol copyFrom: 2 to: aGetterSymbol size) , ':') asSymbol"ScriptingSystem setterSelectorForGetter: #getCursor"