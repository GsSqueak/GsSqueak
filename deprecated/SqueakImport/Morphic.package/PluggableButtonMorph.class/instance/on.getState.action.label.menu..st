initialization
on: anObject getState: getStateSel action: actionSel label: labelSel menu: menuSel

	self model: anObject.
	getStateSelector := getStateSel.
	actionSelector := actionSel.
	getLabelSelector := labelSel.
	getMenuSelector := menuSel.
	
	self update: labelSel.
	self update: getStateSel.
	self updateFillStyle.