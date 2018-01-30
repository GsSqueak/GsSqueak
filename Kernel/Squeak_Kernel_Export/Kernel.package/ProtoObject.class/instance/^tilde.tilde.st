comparing
~~ anObject
	"Answer whether the receiver and the argument are not the same object 
	(do not have the same object pointer).  Primitive.  Optional."
	<primitive: 169>
	self == anObject ifTrue: [^false].
	^true