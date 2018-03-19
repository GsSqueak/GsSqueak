scripts-kernel
removeScriptWithoutUpdatingViewers: aSymbol fromWorld: aWorld 
	self pacifyScript: aSymbol.
	self class removeScriptNamed: aSymbol.
	(self scriptorsForSelector: aSymbol inWorld: aWorld)
		do: [:s | s privateDelete]