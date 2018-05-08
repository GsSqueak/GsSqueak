private
linkOf: anObject ifAbsent: errorBlock 
	
	self	linksDo: [:link | link value = anObject value ifTrue: [^ link]].
	^ errorBlock value