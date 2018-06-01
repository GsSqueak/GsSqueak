instance creation
addDullerToolColors: theme
	"Tool-specific colors."
	
	theme 
		set: #failureColor for: #TestRunner to: Color yellow duller;
		set: #errorColor for: #TestRunner to: Color red duller;
		set: #passColor for: #TestRunner to: Color green duller.