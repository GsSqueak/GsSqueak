submorphs-accessing
indexOfMorphAbove: aPoint 
	"Return index of lowest morph whose bottom is above aPoint.
	Will return 0 if the first morph is not above aPoint."
	submorphs
		withIndexDo: [:mm :ii | mm fullBounds bottom >= aPoint y
				ifTrue: [^ ii - 1]].
	^ submorphs size