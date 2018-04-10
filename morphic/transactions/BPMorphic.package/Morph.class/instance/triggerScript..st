-Etoys-scripting
triggerScript: aSymbol 
	"Have my player perform the script of the given name, which is
	guaranteed to exist."
	^ self assuredPlayer triggerScript: aSymbol