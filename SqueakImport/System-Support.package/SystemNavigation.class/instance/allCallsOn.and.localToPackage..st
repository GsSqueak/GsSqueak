query
allCallsOn: firstLiteral and: secondLiteral localToPackage: packageNameOrInfo
	"Answer a sorted collection of all the methods in the given package that call on both firstLiteral and secondLiteral."
	"self systemNavigation browseAllCallsOn: #not and: #ifTrue: localToPackage: #Compiler"
	| firstList secondList |
	firstList := self allCallsOn: firstLiteral
					fromBehaviors: (self packageInfoFor: packageNameOrInfo) classesAndMetaClasses
					sorted: false.
	secondList := (self 
					allCallsOn: secondLiteral
					fromBehaviors: (firstList collect: [:each | each actualClass] as: IdentitySet)
					sorted: false) asSet.
	firstList removeAllSuchThat: [:each | (secondList includes: each) not].
	^firstList sort