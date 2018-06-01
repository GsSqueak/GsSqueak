private
doDrag: evt with: dragHandle 
	| _gsSqueakTemp_thePoint |
	evt hand obtainHalo: self.
	_gsSqueakTemp_thePoint := target point: evt position - positionOffset from: owner.
	target
		setConstrainedPosition: (target griddedPoint: _gsSqueakTemp_thePoint)
		hangOut: true