initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self addMorph: (yScrollBar := self createScrollBarNamed: 'yScrollBar');
		 addMorph: (xScrollBar := self createScrollBarNamed: 'xScrollBar');
		 addMorph: (scroller := self createScroller).
	""
	self extent: 150 @ 120