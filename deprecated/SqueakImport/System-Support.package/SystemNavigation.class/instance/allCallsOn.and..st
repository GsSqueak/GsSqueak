query
allCallsOn: firstLiteral and: secondLiteral
	"Answer a sorted collection of all the methods that call on both firstLiteral and secondLiteral."

	| firstList secondList |
	firstList := self allCallsOn: firstLiteral.
	secondList := (self 
		allCallsOn: secondLiteral
		fromBehaviors: (firstList collect: [ :each | each actualClass ] as: IdentitySet)
		sorted: false) asSet.
	firstList removeAllSuchThat: [ :each | (secondList includes: each) not ].
	^firstList
	