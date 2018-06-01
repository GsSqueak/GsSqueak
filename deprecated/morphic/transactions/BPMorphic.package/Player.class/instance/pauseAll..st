scripts-standard
pauseAll: scriptName 
	"Change the status of my script of the given name to be #paused in
	me and all of my siblings."
	self assignStatus: #paused toAllFor: scriptName