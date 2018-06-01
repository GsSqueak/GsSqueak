accessing
wantsGradient
	^ wantsGradient ifNil: [self class gradientButton]