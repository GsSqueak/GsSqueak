typing support
startOfTyping
	"Compatibility during change from characterBlock to integer"
	beginTypeInIndex == nil
		ifTrue: [^ nil].
	beginTypeInIndex isNumber
		ifTrue: [^ beginTypeInIndex].
	"Last line for compatibility during change from CharacterBlock to
	Integer. "
	^ beginTypeInIndex stringIndex