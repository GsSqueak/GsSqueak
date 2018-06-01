scripts-kernel
removeScriptWithoutUpdatingViewers: aSymbol 
	self pacifyScript: aSymbol.
	self class removeScriptNamed: aSymbol.
	(self scriptorsForSelector: aSymbol inWorld: costume world)
		do: [:s | s privateDelete]