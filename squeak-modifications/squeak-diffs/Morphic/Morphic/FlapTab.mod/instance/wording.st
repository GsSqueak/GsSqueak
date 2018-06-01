menu
wording
	^ self isCurrentlyTextual
		ifTrue:
			[self existingWording]
		ifFalse:
			[self valueOfProperty: #priorWording ifAbsent: ['---']]