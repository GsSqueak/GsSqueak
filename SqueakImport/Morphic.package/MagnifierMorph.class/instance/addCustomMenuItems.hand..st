menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu
		addLine;
		add: 'magnification...' translated action: #chooseMagnification;
		addUpdating: #trackingPointerString action: #toggleTrackingPointer;
		addUpdating: #showingPointerString action: #toggleShowingPointer.