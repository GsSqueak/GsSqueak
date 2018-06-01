private
createParagraph

	self setProperty: #CreatingParagraph toValue: true.

	[
		self setDefaultContentsIfNil.

		"...Code here to recreate the paragraph..."
		paragraph := (self paragraphClass new textOwner: self owner).
		paragraph wantsColumnBreaks: successor notNil.
		paragraph
			compose: text
			style: textStyle copy
			from: self startingIndex
			in: self container.
		wrapFlag ifFalse:
			["Was given huge container at first... now adjust"
			paragraph adjustRightX].
		paragraph focused: (self currentHand keyboardFocus == self).
	
		self fit.
	] ensure: [self removeProperty: #CreatingParagraph].

	^ paragraph