initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self extent: Display extent - 100;
		 listDirection: #topToBottom;
		 wrapCentering: #topLeft;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 layoutInset: 3.
	pageHolder := PasteUpMorph new behaveLikeHolder extent: self extent -self borderWidth.
	pageHolder hResizing: #shrinkWrap.
	pageHolder wantsMouseOverHalos: false.
	"pageHolder cursor: 0."
	"causes a walkback as of 5/25/2000"
	self addControls.
	self addMorphBack: pageHolder