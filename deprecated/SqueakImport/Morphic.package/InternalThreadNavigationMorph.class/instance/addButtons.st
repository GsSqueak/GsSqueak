initialization
addButtons

	| marginPt i sz data images b1 b2 dot arrowWidth arrowHeight nameMorph sizeRatio controlsColor |

	sizeRatio := self sizeRatio.
	controlsColor := Color orange lighter.

	self changeNoLayout.
	self hResizing: #rigid.
	self vResizing: #rigid.
	marginPt := (4 @ 4 * sizeRatio) rounded..
	i := self currentIndex.
	sz := self myThumbnailSize.
	arrowWidth := (14 * sizeRatio) rounded.
	arrowHeight := (14 * sizeRatio) rounded.
	data := {
		{i - 1. 'Previous:'. #previousPage. #leftCenter. arrowWidth. 'Prev'}.
		{i + 1. 'Next:'. #nextPage. #rightCenter. arrowWidth negated. 'Next'}
	}.
	images := data collect: [ :tuple | | pageNumber f vertices m arrowCenter |
		pageNumber := tuple first.
		(pageNumber between: 1 and: listOfPages size) ifTrue: [
			f := self 
				makeThumbnailForPageNumber: pageNumber 
				scaledToSize: sz 
				default: tuple sixth.
			f := f deepCopy.		"we're going to mess it up"
			arrowCenter := f boundingBox perform: tuple fourth.
			vertices := {
				arrowCenter + (tuple fifth @ arrowHeight negated).
				arrowCenter + (tuple fifth @ arrowHeight).
				arrowCenter.
			}.
			f getCanvas
				drawPolygon: vertices 
				color: controlsColor
				borderWidth: 0 
				borderColor: Color transparent.
			m := ImageMorph new image: f.
			m setBalloonText: tuple second translated,' ',(listOfPages at: pageNumber) first.
			m addMouseUpActionWith: (
				MessageSend receiver: self selector: tuple third
			).
		] ifFalse: [
			f := (Form extent: sz depth: 16) fillColor: Color lightGray.
			m := ImageMorph new image: f.
		].
		m
	].
	b1 := images first.
	b2 := images second.
	dot := EllipseMorph new extent: (18@18 * sizeRatio) rounded; color: controlsColor; borderWidth: 0.

	self addMorph: (b1 position: self position + marginPt).
	self addMorph: (b2 position: b1 topRight + (marginPt x @ 0)).

	self extent: (b1 bottomRight max: b2 bottomRight) - self position + marginPt.
	self addMorph: dot.
	dot align: dot center with: b1 bounds rightCenter + ((marginPt x @ 0) // 2).
	dot setBalloonText: threadName,'
more commands'.
	dot on: #mouseDown send: #moreCommands to: self.
	self fullBounds.
	self addMorph: (nameMorph := SquishedNameMorph new).
	nameMorph
		target: self getSelector: #threadName setSelector: nil;
		color: Color transparent;
		width: self width;
		height: (15 * sizeRatio) rounded;
		align: nameMorph bottomLeft with: self bottomLeft.

