accessing class hierarchy
withAllSuperclassesInEnv: envId do: aBlock 
	"Evaluate the argument, aBlock, for each of the receiver's superclasses."
	aBlock value: self.
	(self superclassForEnv: envId) == nil
		ifFalse: [self superclass withAllSuperclassesInEnv: envId do: aBlock]