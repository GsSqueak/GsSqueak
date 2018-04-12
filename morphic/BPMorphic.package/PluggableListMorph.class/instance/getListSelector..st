initialization
getListSelector: sel 
	"Set the receiver's getListSelector as indicated, and trigger a
	recomputation of the list"
	self setGetListSelector: sel;
		 changed;
		 updateList