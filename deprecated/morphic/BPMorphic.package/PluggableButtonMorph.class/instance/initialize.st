initialization
initialize
	super initialize.
	"Layout properties."
	self extent: 20 @ 15;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		
		layoutInset: (4 @ 0 corner: 4 @ 0);
		 clipSubmorphs: true;
		 wrapCentering: #center;
		 cellPositioning: #topCenter.
	"Initialize instance variables."
	model := nil.
	label := nil.
	getStateSelector := nil.
	actionSelector := nil.
	getLabelSelector := nil.
	getMenuSelector := nil.
	shortcutCharacter := nil.
	askBeforeChanging := false.
	triggerOnMouseDown := false.
	allButtons := nil.
	argumentsProvider := nil.
	argumentsSelector := nil.
	self setDefaultParameters