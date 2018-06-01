message list
selectedMessageName
	"Answer the name of the currently selected message."
	"wod 6/16/1998: answer nil if none are selected."

	messageListIndex = 0 ifTrue: [^ nil].
	^ self setClassAndSelectorIn: [:class :selector | ^ selector]