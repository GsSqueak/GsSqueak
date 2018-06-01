derivatives
derivativeFont: aTTCFontSet at: index

	| newDeriv |
	aTTCFontSet ifNil: [derivatives := nil. ^ self].
	derivatives ifNil: [derivatives := Array new: 32].
	derivatives size < 32 ifTrue: [
		newDeriv := Array new: 32.
		newDeriv replaceFrom: 1 to: derivatives size with: derivatives.
		derivatives := newDeriv.
	].
	derivatives at: index put: aTTCFontSet
