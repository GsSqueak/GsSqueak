accessing
first

	firstIndex > lastIndex ifTrue: [ self errorNoSuchElement ].
	^array at: firstIndex