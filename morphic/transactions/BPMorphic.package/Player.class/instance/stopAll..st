scripts-standard
stopAll: scriptName 
	"Change the status of my script of the given name to be #normal in
	me and all of my siblings."
	self assignStatus: #normal toAllFor: scriptName