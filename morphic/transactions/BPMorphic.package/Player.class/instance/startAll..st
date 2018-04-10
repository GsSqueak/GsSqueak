scripts-standard
startAll: scriptName 
	"Change the status of my script of the given name to be #ticking in
	me and all of my siblings."
	self assignStatus: #ticking toAllFor: scriptName