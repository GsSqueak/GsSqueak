layout
reduceLeftRightImbalance
	| _gsSqueakTemp_correction |
	_gsSqueakTemp_correction := self leftRightImbalance.
	_gsSqueakTemp_correction abs > 1
		ifTrue: [(self proposedCorrectionWouldCauseFocusChange: _gsSqueakTemp_correction)
				ifFalse: [self
						repositionBy: (_gsSqueakTemp_correction abs > 4
								ifTrue: [_gsSqueakTemp_correction sign * 2 @ 0]
								ifFalse: [_gsSqueakTemp_correction sign @ 0])]]
		ifFalse: [self class smartVerticalSplitters
				ifFalse: [self stopStepping]].
	^ _gsSqueakTemp_correction