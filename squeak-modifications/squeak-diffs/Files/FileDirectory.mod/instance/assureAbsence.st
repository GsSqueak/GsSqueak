file directory
assureAbsence
	self exists ifTrue: [ self recursiveDelete ]