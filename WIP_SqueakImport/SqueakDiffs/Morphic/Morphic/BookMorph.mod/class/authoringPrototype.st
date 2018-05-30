scripting
authoringPrototype
	"Answer an instance of the receiver suitable for placing in a parts bin for authors"
	
	| book |
	book := self new initializeToStandAlone.
	book markAsPartsDonor.
	^ book