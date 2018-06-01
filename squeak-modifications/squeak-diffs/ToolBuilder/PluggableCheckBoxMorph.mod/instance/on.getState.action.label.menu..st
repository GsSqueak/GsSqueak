initialization
on: anObject getState: getStateSel action: actionSel label: labelSel menu: menuSel

	self model: anObject.
	self valueSelector: getStateSel.
	self actionSelector: actionSel.
	self label: (self model perform: labelSel).
