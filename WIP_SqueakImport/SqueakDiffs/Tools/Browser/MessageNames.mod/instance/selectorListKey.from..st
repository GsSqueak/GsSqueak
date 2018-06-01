selector list
selectorListKey: aChar from: view
	"Respond to a Command key in the message-list pane."

	aChar == $n ifTrue: [^ self browseSenders].
	aChar == $c ifTrue: [^ self copyName].
	aChar == $b ifTrue: [^ self browseMethodFull].
