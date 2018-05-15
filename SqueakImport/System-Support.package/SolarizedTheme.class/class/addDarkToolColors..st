instance creation
addDarkToolColors: theme
	"Tool-specific colors."
	
	theme 
		set: #failureColor for: #TestRunner to: self yellow;
		set: #errorColor for: #TestRunner to: self red;
		set: #passColor for: #TestRunner to: self green;
		
		set: #failureTextColor for: #TestRunner to: self darkBackground;
		set: #errorTextColor for: #TestRunner to: self darkBackground;
		set: #passTextColor for: #TestRunner to: self darkBackground.
		
	theme
		set: #ignoredOperationAttributes for: #MCOperationsBrowser to: {TextColor color: self darkContentSecondary}.