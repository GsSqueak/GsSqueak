initialization
adaptedToWorld: aWorld 	"If I refer to a world or a hand, return the corresponding items in the	new world."	self isWorldMorph		ifTrue: [^ aWorld]