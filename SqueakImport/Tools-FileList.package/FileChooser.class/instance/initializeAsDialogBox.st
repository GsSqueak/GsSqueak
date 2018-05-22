initialization
initializeAsDialogBox
	self initializeBasicParameters.
	self createDialogBoxUI.
	self morphicView
		useRoundedCorners;
		color: (Color r: 0.9 g: 0.9 b: 0.9);
		adoptPaneColor: (Color r: 0.6 g: 0.7 b: 1).
	self 
		setCaptionColor: Color transparent;
		setButtonColor: (Color r: 0.9 g: 0.9 b: 0.9).
