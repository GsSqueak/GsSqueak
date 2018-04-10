scripts-standard
tellSelfAndAllSiblings: aMessageSelector 
	"Send the given message selector to all my sibling instances, including
	myself "
	Symbol
		hasInterned: aMessageSelector
		ifTrue: [:sel | self belongsToUniClass
				ifTrue: [self class
						allSubInstancesDo: [:anInstance | anInstance triggerScript: sel]]
				ifFalse: [sel ~~ #emptyScript
						ifTrue: [ScriptingSystem reportToUser: 'Cannot "tell" ' , aMessageSelector , ' to ' , self externalName]]]