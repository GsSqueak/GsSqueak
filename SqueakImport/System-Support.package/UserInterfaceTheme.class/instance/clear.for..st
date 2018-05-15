building
clear: propertySymbol for: aClass
	"No longer override the default visual property specified by propertySymbol for any kinds of aClass.  Use the default."
	^ self
		set: propertySymbol
		for: aClass
		to: nil