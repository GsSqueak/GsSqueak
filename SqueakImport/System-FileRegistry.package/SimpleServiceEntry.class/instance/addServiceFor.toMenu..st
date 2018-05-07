services menu
addServiceFor: served toMenu: aMenu
	aMenu add: self label 
		target: self 
		selector: self requestSelector 
		argument: served.
	self useLineAfter ifTrue: [ aMenu addLine ].