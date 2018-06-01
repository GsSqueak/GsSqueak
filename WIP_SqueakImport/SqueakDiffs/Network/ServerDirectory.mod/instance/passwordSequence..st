accessing
passwordSequence: aNumber

	passwordHolder ifNil: [passwordHolder := Password new].
	passwordHolder sequence: aNumber