private
adjustSubmorphPositions

	| p |
	p := 0@0.
	scroller submorphsDo: [ :each | | h |
		each visible ifTrue: [
			h := each height.
			each privateBounds: (p extent: self preferredSubmorphWidth@h).
			p := p + (0@h) ]].
	self 
		clearColumnsCache;
		changed;
		layoutChanged;
		setScrollDeltas.
