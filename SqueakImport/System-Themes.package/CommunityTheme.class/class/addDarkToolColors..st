instance creation
addDarkToolColors: theme
	"Tool-specific colors."
	
	theme 
		set: #failureColor for: #TestRunner to: self dbYellow;
		set: #errorColor for: #TestRunner to: self dbRed;
		set: #passColor for: #TestRunner to: self dbGreen.