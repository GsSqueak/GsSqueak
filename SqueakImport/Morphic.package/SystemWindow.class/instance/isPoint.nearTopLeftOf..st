resize/collapse
isPoint: p nearTopLeftOf: a
	^(self isPoint: p nearTopOf: a) and: [self isPoint: p nearLeftOf: a]