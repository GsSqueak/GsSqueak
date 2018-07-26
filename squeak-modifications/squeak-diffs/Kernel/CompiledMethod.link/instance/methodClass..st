accessing
methodClass: aClass
	"set the class binding in the last literal to aClass"
	self literalAt: self numLiterals put: aClass binding