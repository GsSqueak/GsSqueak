browse
browseAllCallsOnClass: aBehavior
	"Create and schedule a message browser on each method that refers to aBehavior."
	"self default browseAllCallsOnClass: Array"
	
	| behaviorName |
	behaviorName := aBehavior theNonMetaClass name.
	self
		browseMessageList: [ self allCallsOnClass: aBehavior ]
		name: 'Users of ', behaviorName
		autoSelect: behaviorName