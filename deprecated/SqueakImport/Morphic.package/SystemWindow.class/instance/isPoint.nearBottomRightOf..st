resize/collapse
isPoint: p nearBottomRightOf: a
	^(self isPoint: p nearBottomOf: a) and: [self isPoint: p nearRightOf: a]