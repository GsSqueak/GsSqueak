layout
reduceLeftRightImbalance
	| correction |
	correction := self leftRightImbalance.
	correction abs > 1
		ifTrue:
			[ (self proposedCorrectionWouldCauseFocusChange: correction) ifFalse:
				[ self repositionBy:
					(correction abs > 4
						ifTrue: [ correction sign * 2 @ 0 ]
						ifFalse: [ correction sign @ 0 ]) ] ]
		ifFalse:
			[ self class smartVerticalSplitters ifFalse: [ self stopStepping ] ].
	^ correction