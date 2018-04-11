*SqClasses-initialize-release
updateMethodBindingsTo: aBinding
	"ClassBuilder support for maintaining valid method bindings."
	methodDict do: [:method| method methodClassAssociation: aBinding]
