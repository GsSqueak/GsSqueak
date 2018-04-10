scripts-standard
tellAllSiblings: aMessageSelector 
	"Send the given message selector to all my sibling instances, but not
	to myself"
	Symbol
		hasInterned: aMessageSelector
		ifTrue: [:sel | self belongsToUniClass
				ifTrue: [self class
						allSubInstancesDo: [:anInstance | anInstance ~~ self
								ifTrue: [anInstance triggerScript: sel]]]
				ifFalse: [sel ~~ #emptyScript
						ifTrue: [ScriptingSystem reportToUser: 'Cannot "tell" ' , aMessageSelector , ' to ' , self externalName]]]