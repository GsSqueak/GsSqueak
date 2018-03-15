system category list
systemCatListKey: aChar from: view
	"Respond to a Command key.  I am a model with a code pane, and I also have a listView that has a list of methods.  The view knows how to get the list and selection."

	aChar == $f ifTrue: [^ self findClass].
	"aChar == $x ifTrue: [^ self removeSystemCategory].
	aChar == $b ifTrue: [^ self recent].
	^ self classListKey: aChar from: view"