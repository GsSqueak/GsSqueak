compiling
allowUnderscoreAssignments
	"Return true if the receiver and its subclasses should be allowed to use underscore as assignment operator. Returning nil here means that the compiler should use the system-wide default preference. Also see #allowUnderscoreSelectors.

	Combinations: If both preferences are false, underscore is illegal. If both preferences are true, underscore assignment needs the be surrounded by spaces and a single underscore cannot be used as selector."
	^nil
