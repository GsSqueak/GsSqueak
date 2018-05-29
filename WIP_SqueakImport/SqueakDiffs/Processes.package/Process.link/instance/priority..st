accessing
priority: anInteger 
	"Use the range checking code from squeak to produce the same error as Squeak if anInteger
	is out of range. Setting the priority is actually a primitive in GemStone"
	
	(anInteger >= Processor lowestPriority and:[anInteger <= Processor highestPriority])
		ifTrue: [self _env0 priority: anInteger]
		ifFalse: [self error: 'Invalid priority: ', anInteger printString]
