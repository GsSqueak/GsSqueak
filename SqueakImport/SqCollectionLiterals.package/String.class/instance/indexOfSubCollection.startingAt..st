accessing
indexOfSubCollection: subCollection startingAt: start

	subCollection isString ifFalse: [ ^super indexOfSubCollection: subCollection startingAt: start ].
	^self findString: subCollection startingAt: start caseSensitive: true