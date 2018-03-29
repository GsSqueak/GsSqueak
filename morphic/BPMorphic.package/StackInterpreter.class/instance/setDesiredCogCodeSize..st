internal interpreter access
setDesiredCogCodeSize: dccs 
	"This should perhaps be a no-op in the StackVM, but we implement it
	for the convenience of bootstrap scripts etc."
	theUnknownShort := dccs