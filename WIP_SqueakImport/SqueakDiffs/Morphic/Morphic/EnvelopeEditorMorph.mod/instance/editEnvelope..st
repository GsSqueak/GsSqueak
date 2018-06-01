initialization
editEnvelope: env
	envelope := env.
	limits := Array with: envelope loopStartIndex
				with: envelope loopEndIndex
				with: envelope points size.
	limitXs := limits collect: [:i | (envelope points at: i) x].
	self buildView