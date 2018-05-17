instance creation
addToolColors: theme
	"Tool-specific colors."
	
	"SUnit's TestRunner."
	theme 
		set: #failureColor for: #TestRunner to: Color yellow;
		set: #errorColor for: #TestRunner to: Color red;
		set: #passColor for: #TestRunner to: Color green;
		
		derive: #failureTextColor for: #TestRunner from: #PluggableTextMorph at: #textColor;
		derive: #errorTextColor for: #TestRunner from: #PluggableTextMorph at: #textColor;
		derive: #passTextColor for: #TestRunner from: #PluggableTextMorph at: #textColor.
		
	"Monticello Tools."
	theme
		set: #revertedOperationAttributes for: #MCOperationsBrowser to: {TextEmphasis struckOut};
		set: #ignoredOperationAttributes for: #MCOperationsBrowser to: {TextColor color: Color gray}.
		"set: #rejectedOperationAttributes for: #MCOperationsBrowser to: {TextEmphasis struckOut};
		set: #acceptedOperationAttributes for: #MCOperationsBrowser to: {TextEmphasis underlined};
		set: #conflictingOperationAttributes for: #MCOperationsBrowser to: {TextEmphasis bold}."
		
	"Halos."
	theme
		derive: #borderColor for: #HaloMorph from: #MenuItemMorph at: #selectionColor do: [:c | c alpha: 0.8];
		derive: #borderColor for: #SelectionMorph from: #MenuItemMorph at: #selectionColor do: [:c | c twiceDarker alpha: 0.75];
		derive: #color for: #SelectionMorph from: #MenuItemMorph at: #selectionColor do: [:c | c alpha: 0.08].