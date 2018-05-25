*SqClasses-accessing
name
	"Answer a String that is the name of the receiver, either 'Metaclass' or 
	the name of the receiver's class followed by ' class'."

	destClass == nil
		ifTrue: [^'a Metaclass']
		ifFalse: [^destClass name , ' class']
