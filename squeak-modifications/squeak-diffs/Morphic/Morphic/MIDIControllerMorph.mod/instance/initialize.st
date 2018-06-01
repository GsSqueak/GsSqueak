initialization
initialize
"initialize the state of the receiver"
	| slider |
	super initialize.
""
	self listDirection: #topToBottom.
	self wrapCentering: #center;
		 cellPositioning: #topCenter.
	self hResizing: #shrinkWrap.
	self vResizing: #shrinkWrap.
	channel := 0.
	controller := 7.
	"channel volume"
	slider := SimpleSliderMorph new target: self;
				 actionSelector: #newSliderValue:;
				 minVal: 0;
				 maxVal: 127;
				 extent: 128 @ 10.
	self addMorphBack: slider.
	self
		addMorphBack: (StringMorph contents: 'Midi Controller').
	self updateLabel