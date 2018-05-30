instance creation
newShowingPointer
	"Answer a Magnifier that also displays Morphs in the Hand and the Hand position"

	^(self new)
		showPointer: true;
		setNameTo: 'HandMagnifier';
		yourself