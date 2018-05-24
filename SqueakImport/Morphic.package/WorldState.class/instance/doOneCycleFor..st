update cycle
doOneCycleFor: aWorld
	"Do one cycle of the interaction loop. This method is called repeatedly when the world is running.

This is a moderately private method; a better alternative is usually either to wait for events or to check the state of things from #step methods."

	self interCyclePause: (Preferences higherPerformance ifTrue: [1] ifFalse: [MinCycleLapse]).
	self doOneCycleNowFor: aWorld.