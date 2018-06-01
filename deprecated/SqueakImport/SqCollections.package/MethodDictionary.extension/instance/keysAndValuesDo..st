*SqCollections-enumeration
keysAndValuesDo: aBlock 
	"Enumerate the receiver with all the keys and values passed to the block"
	
	^ self _env0 keysAndValuesDo: aBlock 
