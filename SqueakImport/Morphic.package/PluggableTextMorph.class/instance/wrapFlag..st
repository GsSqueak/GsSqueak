accessing
wrapFlag: aBoolean

	textMorph ifNil: [self setText: ''].
	textMorph
		wrapFlag: aBoolean;
		autoFit: true.
	
	"Text navigation will be tedious if there is no horizontal scroll bar w/o wrapping."
	aBoolean ifFalse: [self showHScrollBarOnlyWhenNeeded].

	self
		resizeScrollBars;
		resizeScroller;
		hideOrShowScrollBars;
		setScrollDeltas.