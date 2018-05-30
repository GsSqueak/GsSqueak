accessing
isActiveManager
	"Answer whether I should act as the active ui manager"
	"This is really a way of answering whether 'Smalltalk isMVC'"
	ScheduledControllers ifNil:[^false].
	^ScheduledControllers activeControllerProcess == Processor activeProcess