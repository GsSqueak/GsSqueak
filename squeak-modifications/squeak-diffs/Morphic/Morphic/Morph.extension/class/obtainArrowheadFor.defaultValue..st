*Morphic-MorphicExtras-arrow head size
obtainArrowheadFor: aPrompt defaultValue: defaultPoint
	"Allow the user to supply a point to serve as an arrowhead size.  Answer nil if we fail to get a good point"

	| result  |
	result := UIManager default request: aPrompt initialAnswer: defaultPoint asString.
	result isEmptyOrNil ifTrue: [^ nil].
	^ [(Point readFrom: (ReadStream on: result))]
		on: Error do: [:ex |  nil].