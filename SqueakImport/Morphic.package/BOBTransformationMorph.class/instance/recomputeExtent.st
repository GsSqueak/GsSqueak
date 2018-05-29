as yet unclassified
recomputeExtent

	| scalePt newScale theGreenThingie greenIBE myNewExtent |

	submorphs isEmpty ifTrue: [^self extent].
	worldBoundsToShow ifNil: [worldBoundsToShow := self firstSubmorph bounds].
	worldBoundsToShow area = 0 ifTrue: [^self extent].
	scalePt := owner innerBounds extent / worldBoundsToShow extent.
	newScale := scalePt x min: scalePt y.
	theGreenThingie := owner.
	greenIBE := theGreenThingie innerBounds extent.
	myNewExtent := (greenIBE min: worldBoundsToShow extent * newScale) truncated.
	self
		scale: newScale;
		offset: worldBoundsToShow origin * newScale.
	smoothing := (newScale < 1.0) ifTrue: [2] ifFalse: [1].
	^myNewExtent