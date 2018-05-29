instance creation
instanceOfUniqueClassWithInstVarString: instVarString andClassInstVarString: classInstVarString
	"Create a unique class for the receiver, and answer an instance of it"

	^ (self newUniqueClassInstVars: instVarString 
		classInstVars: classInstVarString) initialInstance
