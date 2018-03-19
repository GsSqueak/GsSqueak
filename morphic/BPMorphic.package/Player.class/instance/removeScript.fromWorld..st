scripts-kernel
removeScript: aSymbol fromWorld: aWorld 
	"Remove the given script, and get the display right in aWorld"
	self removeScriptWithoutUpdatingViewers: aSymbol fromWorld: aWorld.
	self updateAllViewersAndForceToShow: #scripts