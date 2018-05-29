accessing
isActiveBuilder
	"Answer whether I am the currently active builder"
	"This is really a way of answering whether 'Smalltalk isMVC'"
	ScheduledControllers ifNil:[^false].
	^(ScheduledControllers activeControllerProcess ifNil:[^false]) isTerminated not