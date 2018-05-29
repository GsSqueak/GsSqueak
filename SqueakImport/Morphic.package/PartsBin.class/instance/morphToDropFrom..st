dropping/grabbing
morphToDropFrom: aMorph
	"Answer the morph to drop if the user attempts to drop aMorph"

	| aButton |
	((aMorph isKindOf: IconicButton) and: [aMorph actionSelector == #launchPartVia:label:])
		ifTrue: [^ aMorph].  
	"The above handles the unusual case of a button that's already set up in a manner suitable for living in PartsBin; the archetypal example is the attempt to reposition an object within a partsflap by dragging it via the black halo handle."

	aButton := IconicButton new.
	aButton color: self color;
		initializeToShow: aMorph withLabel: aMorph externalName andSend: #veryDeepCopy to: aMorph veryDeepCopy.
	^ aButton