-Etoys-customevents-scripting
triggerEtoyEvent: aSymbol 
	"Trigger whatever scripts may be connected to the event named
	aSymbol. If anyone comes back to ask who sent it, return our player."
	[self triggerEvent: aSymbol]
		on: GetTriggeringObjectNotification
		do: [:ex | ex isNested
				ifTrue: [ex pass]
				ifFalse: [ex resume: self assuredPlayer]]