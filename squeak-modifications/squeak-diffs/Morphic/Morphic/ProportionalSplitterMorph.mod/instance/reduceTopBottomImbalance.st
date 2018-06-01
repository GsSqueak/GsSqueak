layout
reduceTopBottomImbalance
	| correction |
	(correction := self topBottomCorrection) isZero
		ifTrue:
			[ self class smartHorizontalSplitters ifFalse: [ self stopStepping ] ]
		ifFalse:
			[ (self proposedCorrectionWouldCauseFocusChange: correction) ifFalse: [ self repositionBy: 0 @ correction ] ].
	^ correction