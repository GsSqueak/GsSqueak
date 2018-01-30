accessing
basicAddInstanceVarNamed: aName withValue: aValue
	"Add an instance variable named aName and give it value aValue"
	self class addInstVarName: aName asString.
	self instVarAt: self class instSize put: aValue