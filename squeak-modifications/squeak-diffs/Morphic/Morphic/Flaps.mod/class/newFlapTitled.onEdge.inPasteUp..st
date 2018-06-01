new flap
newFlapTitled: aString onEdge: anEdge inPasteUp: aPasteUpMorph
	"Add a flap with the given title, placing it on the given edge, in the given pasteup"

	| aFlapBody aFlapTab  |
	aFlapBody := PasteUpMorph newSticky.
	aFlapTab := FlapTab new referent: aFlapBody.
	aFlapTab setName: aString edge: anEdge color: (Color r: 0.516 g: 0.452 b: 1.0).

	anEdge == #left ifTrue:
		[aFlapTab position: (aPasteUpMorph left @ aPasteUpMorph top).
		aFlapBody extent: (200 @ aPasteUpMorph height)].
	anEdge == #right ifTrue:
		[aFlapTab position: ((aPasteUpMorph right - aFlapTab width) @ aPasteUpMorph top).
		aFlapBody extent: (200 @ aPasteUpMorph height)].
	anEdge == #top ifTrue:
		[aFlapTab position: ((aPasteUpMorph left + 50) @ aPasteUpMorph top).
		aFlapBody extent: (aPasteUpMorph width @ 200)].
	anEdge == #bottom ifTrue:
		[aFlapTab position: ((aPasteUpMorph left + 50) @ (aPasteUpMorph bottom - aFlapTab height)).
		aFlapBody extent: (aPasteUpMorph width @ 200)].

	aFlapBody
		beFlap: true;
		color: self defaultColorForFlapBackgrounds;
		changeTableLayout.
	^ aFlapTab