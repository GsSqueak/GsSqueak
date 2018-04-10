scripts-kernel
editDescriptionForSelector: aSelector 
	"Allow the user to edit the balloon-help description for the given
	selector "
	(self class userScriptForPlayer: self selector: aSelector) editDescription.
	self updateAllViewers