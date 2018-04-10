layout
reduceTopBottomImbalance
	| _gsSqueakTemp_correction |
	(_gsSqueakTemp_correction := self topBottomCorrection) isZero
		ifTrue: [self class smartHorizontalSplitters
				ifFalse: [self stopStepping]]
		ifFalse: [(self proposedCorrectionWouldCauseFocusChange: _gsSqueakTemp_correction)
				ifFalse: [self repositionBy: 0 @ _gsSqueakTemp_correction]].
	^ _gsSqueakTemp_correction