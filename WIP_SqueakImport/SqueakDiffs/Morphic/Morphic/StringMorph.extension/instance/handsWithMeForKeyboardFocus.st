*Morphic-MorphicExtras-accessing
handsWithMeForKeyboardFocus
	"Answer the hands that have me as their keyboard focus"

	hasFocus ifFalse: [^ #()].
	^ self currentWorld hands select:
		[:aHand |
		| foc |
		(foc := aHand keyboardFocus) notNil and: [foc owner == self]]