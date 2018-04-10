scripts-standard
performScriptIfCan: scriptNameString 
	"If I understand the given script name, perform it now"
	^ Symbol
		hasInterned: scriptNameString
		ifTrue: [:sym | (self class includesSelector: sym)
				ifTrue: [self triggerScript: sym]]