scripts-standard
startScript: scriptName 
	"Change the status of my script of the given name to be #ticking"
	self changeScript: scriptName toStatus: #ticking