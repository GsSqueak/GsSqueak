file reader registration
detectService: aBlock ifNone: anotherBlock 
	"self detectService: [:each | each selector = #fileIn:] ifNone: [nil]"
	^ self allRegisteredServices detect: aBlock ifNone: anotherBlock