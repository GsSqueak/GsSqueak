editing
placeHandles
	"Add the handles to my submorphs."
	handles reverseDo: [:each | self addMorphFront: each ] .
	
	