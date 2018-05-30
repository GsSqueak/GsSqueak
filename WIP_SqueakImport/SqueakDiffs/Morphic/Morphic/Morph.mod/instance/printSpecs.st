printing
printSpecs

	| printSpecs |

	printSpecs := self valueOfProperty: #PrintSpecifications.
	printSpecs ifNil: [
		printSpecs := PrintSpecifications defaultSpecs.
		self printSpecs: printSpecs.
	].
	^printSpecs