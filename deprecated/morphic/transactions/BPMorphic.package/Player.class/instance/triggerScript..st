customevents-custom events
triggerScript: aSymbol 
	"Perform the script of the given name,
	which is guaranteed to exist.
	However, it's possible that the script may still result in a DNU,
	which will be swallowed and reported to the Transcript."
	^ [[self perform: aSymbol]
		on: GetTriggeringObjectNotification
		do: [:ex | ex isNested
				ifTrue: [ex pass]
				ifFalse: [ex resume: self]]]
		on: MessageNotUnderstood
		do: [:ex | 
			ScriptingSystem
				reportToUser: (String
						streamContents: [:s | s nextPutAll: self externalName;
								 nextPutAll: ': exception in script ';
								 print: aSymbol;
								 nextPutAll: ' : ';
								 print: ex]).
			ex return: self
			"ex pass"]