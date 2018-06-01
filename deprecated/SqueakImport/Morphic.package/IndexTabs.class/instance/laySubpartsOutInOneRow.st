layout
laySubpartsOutInOneRow
	| aPosition neededHeight widthToUse mid |
	fixedWidth ifNotNil: [self error: 'incompatibility in IndexTabs'].
	verticalPadding ifNil: [verticalPadding := 4].  "for benefit of old structures"
	aPosition := self topLeft.
	neededHeight := self basicHeight.
	submorphs do:
		[:aMorph |
			aMorph position: (aPosition + (padding @ 0)).
			aPosition := aMorph topRight.
			neededHeight := neededHeight max: aMorph height].
	neededHeight := neededHeight + (verticalPadding * 2).
	mid := self top + (neededHeight // 2).
	submorphs do:
		[:aMorph |
			aMorph top: (mid - (aMorph height // 2))].
	widthToUse := self widthImposedByOwner max: self requiredWidth.
	self extent: (((aPosition x + padding - self left) max: widthToUse) @ neededHeight)