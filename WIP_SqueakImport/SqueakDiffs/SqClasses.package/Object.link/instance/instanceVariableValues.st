macpal
instanceVariableValues
	"Answer a collection whose elements are the values of those instance variables of the receiver which were added by the receiver's class"
	| c |
	c := OrderedCollection new.
	self class superclass instSize + 1 to: self class instSize do:
		[:i | c add: (self instVarAt: i)].
	^ c
