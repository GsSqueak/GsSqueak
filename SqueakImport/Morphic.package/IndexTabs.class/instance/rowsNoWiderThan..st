layout
rowsNoWiderThan: maxWidth
	| aPosition neededHeight |
	self fixedWidth: maxWidth.
	verticalPadding ifNil: [verticalPadding := 4].  "for benefit of old structures"
	aPosition := self topLeft.
	neededHeight := self basicHeight.
	submorphs do:
		[:aMorph |
			aMorph position: (aPosition + (padding @ 0)).
			(aMorph right > (self left + maxWidth)) ifTrue:
				[aPosition := self left @ (aPosition y + neededHeight).
				aMorph position: aPosition + (padding @ 0).
				neededHeight := self basicHeight].
			aPosition := aMorph topRight.
			neededHeight := neededHeight max: aMorph height].
	self extent: (maxWidth @ ((aPosition y + neededHeight) - self top))