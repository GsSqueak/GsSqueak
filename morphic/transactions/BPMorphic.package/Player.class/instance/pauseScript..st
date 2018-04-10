scripts-standard
pauseScript: scriptName 
	"Change the status of my script of the given name to be #paused"
	self changeScript: scriptName toStatus: #paused