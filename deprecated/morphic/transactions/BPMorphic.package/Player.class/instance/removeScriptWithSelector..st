scripts-kernel
removeScriptWithSelector: aSelector 
	"Remove the given script, and get the display right"
	self removeScript: aSelector fromWorld: self currentWorld