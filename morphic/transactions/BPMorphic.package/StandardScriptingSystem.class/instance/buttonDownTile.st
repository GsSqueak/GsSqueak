-Etoys-utilities
buttonDownTile
	"Answer a boolean-valued tile which reports whether the button is
	down "
	^ self systemQueryPhraseWithActionString: '(ActiveHand anyButtonPressed)' labelled: 'button down?' translated