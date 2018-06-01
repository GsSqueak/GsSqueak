e-toy support
isLikelyRecipientForMouseOverHalos

	self player ifNil: [^ false].
	self player getHeading = 0.0 ifTrue: [^ false].
	^ true.
