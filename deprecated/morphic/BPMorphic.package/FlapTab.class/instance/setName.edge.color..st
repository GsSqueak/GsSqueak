initialization
setName: nameString edge: edgeSymbol color: flapColor 
	"Set me up with the usual..."
	self setNameTo: nameString.
	self edgeToAdhereTo: edgeSymbol;
		 inboard: false.
	self
		assumeString: nameString
		font: Preferences standardFlapFont
		orientation: self orientation
		color: flapColor.
	self setToPopOutOnDragOver: true.
	self setToPopOutOnMouseOver: false