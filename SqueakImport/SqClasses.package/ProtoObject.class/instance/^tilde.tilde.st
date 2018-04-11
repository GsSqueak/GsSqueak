*SqClasses-comparing
~~ anObject
	"Answer whether the receiver and the argument are not the same object 
	(do not have the same object pointer).  Primitive.  Optional."
	self == anObject ifTrue: [^false].
	^true
