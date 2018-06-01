parts bin
partsBinString
	"Answer the string to be shown in a menu to represent the 
	parts-bin status"
	^ (referent isPartsBin
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'parts-bin' translated