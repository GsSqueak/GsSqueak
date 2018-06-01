help dictionary
helpStringOrNilFor: aSymbol 
	"If my HelpStrings dictionary has an entry at the given symbol, 
	answer that entry's value, else answer nil"
	HelpStrings
		at: aSymbol
		ifPresent:[:string | ^ string translated].
^ nil