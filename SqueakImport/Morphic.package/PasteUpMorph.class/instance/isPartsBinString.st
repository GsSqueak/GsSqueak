menu & halo
isPartsBinString
	"Answer the string to be shown in a menu to represent the 
	parts-bin status"
	^ (self isPartsBin
		ifTrue: ['<on>']
		ifFalse: ['<off>']), 'parts bin' translated