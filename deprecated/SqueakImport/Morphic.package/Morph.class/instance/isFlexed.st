testing
isFlexed
	"Return true if the receiver is currently flexed"
	owner ifNil:[^false].
	^owner isFlexMorph