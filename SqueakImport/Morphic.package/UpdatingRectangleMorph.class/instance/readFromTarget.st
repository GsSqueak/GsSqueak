target access
readFromTarget
	"Read the color value from my target"

	| v |
	(target isNil or: [getSelector isNil]) ifTrue: [^contents].
	target isMorph ifTrue: [target isInWorld ifFalse: [^contents]].
	v := self valueProvider perform: getSelector.
	lastValue := v.
	^v