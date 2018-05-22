open/close
postAcceptBrowseFor: anotherSystemWindow
	"If I am taking over browsing for anotherSystemWindow, sucblasses may override to, for example, position me to the object to be focused on."
	self model postAcceptBrowseFor: anotherSystemWindow model