*SqClasses-copying
copyAddedStateFrom: anotherObject
	"Copy over the values of instance variables added by the receiver's class from anotherObject to the receiver.  These will be remapped in mapUniClasses, if needed."

	self class superclass instSize + 1 to: self class instSize do:
		[:index | self instVarAt: index put: (anotherObject instVarAt: index)]
