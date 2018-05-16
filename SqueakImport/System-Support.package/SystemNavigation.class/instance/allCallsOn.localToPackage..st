query
allCallsOn: aLiteral localToPackage: packageNameOrInfo
	"Answer a sorted collection of MethodReferences for all the methods that call on aLiteral in the given package."

	| result |
	result := self
				allCallsOn: aLiteral
				fromBehaviors: (self packageInfoFor: packageNameOrInfo) classesAndMetaClasses
				sorted: false.
	result := result, (self
						allCallsOn: aLiteral
						fromMethodReferences: (self packageInfoFor: packageNameOrInfo) extensionMethods
						sorted: false).
	^result sort