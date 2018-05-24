class creation
optionForElementSize: anInteger
	"Returns the GemStone option used in the byteSubclass: command to create element access of size anInteger."
	anInteger = 1 ifTrue: [^ #()].
	anInteger = 2 ifTrue: [^ #(#'2byteWords')].
	anInteger = 4 ifTrue: [^ #(#'4byteWords')].
	anInteger = 8 ifTrue: [^ #(#'8byteWords')].
	self error: 'Element size not supported'