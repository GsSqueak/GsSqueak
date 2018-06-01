misc
revertToUnscriptedPlayerIfAppropriate
	| _gsSqueakTemp_anInstance |
	(self class selectors notEmpty
			or: [self class instVarNames notEmpty])
		ifTrue: [^ self].
	_gsSqueakTemp_anInstance := UnscriptedPlayer new.
	_gsSqueakTemp_anInstance initializeCostumesFrom: self.
	self becomeForward: _gsSqueakTemp_anInstance