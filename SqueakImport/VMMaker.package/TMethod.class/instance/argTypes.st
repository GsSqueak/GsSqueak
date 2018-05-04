accessing
argTypes
	"Get the types of the parameters of this method"

	^args collect: [ :a | self declarationAt: a ]