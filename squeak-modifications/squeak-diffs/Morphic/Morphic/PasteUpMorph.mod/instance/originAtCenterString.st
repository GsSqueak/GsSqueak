menu & halo
originAtCenterString
	"Answer the string to be shown in a menu to represent the 
	origin-at-center status"
	^ ((self hasProperty: #originAtCenter)
		ifTrue: ['<on>']
		ifFalse: ['<off>']), 'origin-at-center' translated