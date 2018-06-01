resize/collapse
isPoint: p nearBottomLeftOf: a
	^(self isPoint: p nearBottomOf: a) and: [self isPoint: p nearLeftOf: a]