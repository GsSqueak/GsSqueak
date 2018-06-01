events
step
	splitsTopAndBottom
		ifTrue: [self reduceTopBottomImbalance]
		ifFalse: [self reduceLeftRightImbalance abs > 1
				ifTrue: [self
						splittersLeftDo: [:splitter | splitter reduceLeftRightImbalance].
					self
						splittersRightDo: [:splitter | splitter reduceLeftRightImbalance]]]