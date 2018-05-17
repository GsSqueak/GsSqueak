instance creation
addLightToolColors: theme
	"Tool-specific colors."
	
	theme 
		set: #failureColor for: #TestRunner to: self yellow;
		set: #errorColor for: #TestRunner to: self red;
		set: #passColor for: #TestRunner to: self green;

		set: #failureTextColor for: #TestRunner to: self lightBackground;
		set: #errorTextColor for: #TestRunner to: self lightBackground;
		set: #passTextColor for: #TestRunner to: self lightBackground.
		
	theme
		set: #ignoredOperationAttributes for: #MCOperationsBrowser to: {TextColor color: self lightContentSecondary}.