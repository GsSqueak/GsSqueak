updating
update: aSymbol
	"Update the value."
	
	super update: aSymbol.
	
	aSymbol = self getValueSelector ifTrue: [self getValue. ^ self].
	aSymbol = self getMinimumValueSelector ifTrue: [self getMinimumValue. ^ self].
	aSymbol = self getMaximumValueSelector ifTrue: [self getMaximumValue. ^ self].