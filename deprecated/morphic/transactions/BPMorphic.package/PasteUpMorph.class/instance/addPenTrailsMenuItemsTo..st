menu & halo
addPenTrailsMenuItemsTo: aMenu 
	"Add items relating to pen trails to aMenu"
	| oldTarget |
	oldTarget := aMenu defaultTarget.
	aMenu defaultTarget: self.
	aMenu add: 'clear pen trails' translated action: #clearTurtleTrails.
	aMenu addLine.
	aMenu add: 'all pens up' translated action: #liftAllPens.
	aMenu add: 'all pens down' translated action: #lowerAllPens.
	aMenu addLine.
	aMenu add: 'all pens show lines' translated action: #linesForAllPens.
	aMenu add: 'all pens show arrowheads' translated action: #arrowsForAllPens.
	aMenu add: 'all pens show arrows' translated action: #linesAndArrowsForAllPens.
	aMenu add: 'all pens show dots' translated action: #dotsForAllPens.
	aMenu defaultTarget: oldTarget