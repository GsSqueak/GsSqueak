initialization
setServer
	"Mark me as a new project.  See if a server is known, remember it."

	self projectParameters at: #exportState put: #nacent.
	urlList isEmptyOrNil ifTrue: [urlList := parentProject urlList].