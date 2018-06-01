file directory
entryAt: fileName ifAbsent: aBlock 
	"Find the entry with local name fileName and answer it.
	If not found, answer the result of evaluating aBlock."
	^ self entries 
		detect: [ : entry | entry name = fileName ]
		ifNone: aBlock