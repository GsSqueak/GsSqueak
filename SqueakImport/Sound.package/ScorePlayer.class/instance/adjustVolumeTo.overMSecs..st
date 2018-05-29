volume
adjustVolumeTo: vol overMSecs: mSecs
	| normalizedVolume incr block |
	normalizedVolume := (vol asFloat min: 1.0) max: 0.0.
	incr := (self overallVolume - normalizedVolume) / mSecs * 50.0.
	block := normalizedVolume > 0.0
		ifTrue: [
			[[(normalizedVolume - self overallVolume) abs > 0.01] whileTrue: [self overallVolume: self overallVolume - incr. (Delay forMilliseconds: 50) wait]]]
		ifFalse: [
			[[self overallVolume > 0.0] whileTrue: [self overallVolume: self overallVolume - incr. (Delay forMilliseconds: 50) wait]. self pause]].
	block fork
