preferences
setRecentHistorySize
	"Let the user specify the recent history size."
	self numberOfRecentSubmissionsToStore:
		(UIManager default
			request: 'How many recent changes
should be remembered?'
			initialAnswer: self numberOfRecentSubmissionsToStore asString)