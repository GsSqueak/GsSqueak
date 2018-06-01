updating
update: aSymbol
	"Update the value."
	
	super update: aSymbol.
	aSymbol == self getEnabledSelector ifTrue: [
		^self updateEnabled].