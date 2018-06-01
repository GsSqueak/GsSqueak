as yet unclassified
changeOffsetTo: aPoint

	| transform trialOffset innerPasteup keepWidth keepHeight |

	transform := self myTransformMorph.
	keepWidth := transform width "// 4".
	keepHeight := transform height "// 4".
	innerPasteup := transform firstSubmorph.
	trialOffset := aPoint.
	trialOffset := 
		(trialOffset x 
			min: (innerPasteup width * transform scale) - keepWidth 
			max: keepWidth - transform width) @ 
		(trialOffset y 
			min: (innerPasteup height * transform scale) - keepHeight 
			max: keepHeight - transform height).
	transform offset: trialOffset.

