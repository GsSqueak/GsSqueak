*System-Localization
literalStringsDo: aBlock 
	"Assuming the receiver receiver is a literal, evaluate aBlock with all Strings (but not Symbols) within it."
	aBlock value: self