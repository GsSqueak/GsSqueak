-Etoys-utilities
buttonUpTile
	"Answer a boolean-valued tile which reports whether the button is up"
	^ self systemQueryPhraseWithActionString: '(ActiveHand noButtonPressed)' labelled: 'button up?' translated