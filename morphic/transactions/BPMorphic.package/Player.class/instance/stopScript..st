scripts-standard
stopScript: scriptName 
	"Change the status of my script of the given name to be #normal"
	self changeScript: scriptName toStatus: #normal