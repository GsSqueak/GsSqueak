accessing
last

	firstIndex > lastIndex ifTrue: [ self errorNoSuchElement ].
	^array at: lastIndex