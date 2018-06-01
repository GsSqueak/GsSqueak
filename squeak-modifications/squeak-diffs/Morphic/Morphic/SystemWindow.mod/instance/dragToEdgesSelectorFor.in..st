resize/collapse
dragToEdgesSelectorFor: p in: a
	"answer first matching drag resize selector, if none is found, answer nil"
	#(isPoint:nearTopLeftOf: isPoint:nearTopRightOf: isPoint:nearBottomLeftOf: isPoint:nearBottomRightOf: isPoint:nearTopOf: isPoint:nearBottomOf: isPoint:nearLeftOf: isPoint:nearRightOf:)
		with: #(topLeftQuadrant topRightQuadrant bottomLeftQuadrant bottomRightQuadrant topHalf bottomHalf leftHalf rightHalf)
		do: [:predicate :selector |
			(self perform: predicate with: p with: a) ifTrue: [^selector]].
	^nil