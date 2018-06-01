as yet unclassified
makeBookStyle: nColumns

	| all totalWidth second columnWidth currY prev columnHeight currX currColumn pageBreakRectangles r rm columnGap pageGap starter |

	pageBreakRectangles := OrderedCollection new.
	all := thePasteUp allTextPlusMorphs.
	all size = 1 ifFalse: [^self].
	Cursor wait show.
	starter := prev := all first.
	totalWidth := self width - 16.
	columnGap := 32.
	pageGap := 16.
	columnWidth := totalWidth - (columnGap * (nColumns - 1)) // nColumns.
	columnHeight := self height - 12.
	currY := 4.
	currX := 4.
	currColumn := 1.
	prev
		position: currX@currY;
		width: columnWidth.
	[
		second := prev makeSuccessorMorph.
		thePasteUp addMorphBack: second.
		prev 
			setProperty: #autoFitContents toValue: false;
			height: columnHeight.
		(currColumn := currColumn + 1) <= nColumns ifTrue: [
			currX := currX + columnWidth + columnGap.
		] ifFalse: [
			r := 4@(prev bottom + 4) corner: (self right - 4 @ (prev bottom + pageGap - 4)).
			rm := RectangleMorph new bounds: r; color: (Color gray alpha: 0.3); borderWidth: 0.
			pageBreakRectangles add: rm beSticky.
			thePasteUp addMorphBack: rm.
			currColumn := 1.
			currX := 4.
			currY := prev bottom + pageGap.
		].
		second 
			autoFit: true;
			position: currX@currY;
			width: columnWidth.
		prev recomposeChain.		"was commented"
		prev := second.
		prev height > columnHeight
	] whileTrue.
	prev autoFit: true.
	thePasteUp height: (prev bottom + 20 - self top).
	self layoutChanged.
	self setProperty: #pageBreakRectangles toValue: pageBreakRectangles.
	thePasteUp allTextPlusMorphs do: [ :each |
		each repositionAnchoredMorphs
	].
	Cursor normal show.
