resize/collapse
isPoint: p nearTopRightOf: a
	^(self isPoint: p nearTopOf: a) and: [self isPoint: p nearRightOf: a]