categories & search pane
newSearchPane
	"Answer a new search pane for the receiver"

	| aTextMorph |
	aTextMorph := PluggableTextMorph on: self
					text: #lastSearchString accept: #lastSearchString:
					readSelection: nil menu: nil.
	aTextMorph setProperty: #alwaysAccept toValue: true.
	aTextMorph askBeforeDiscardingEdits: false.
	aTextMorph acceptOnCR: true.
	aTextMorph setBalloonText: 'Type here and hit ENTER, and all methods whose selectors match what you typed will appear in the list pane below.'.
	^ aTextMorph