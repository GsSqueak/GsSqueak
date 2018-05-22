query
allCallsOn: aSymbol from: aBehavior
	"Answer a sorted collection of all the methods from aBehavior and it's subclasses that call on aSymbol."

	^self allCallsOn: aSymbol fromBehaviors: aBehavior withAllSubclasses sorted: true