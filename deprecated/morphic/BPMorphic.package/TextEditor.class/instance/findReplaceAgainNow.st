typing support
findReplaceAgainNow
	self hasSelection
		ifTrue: ["Search from the beginning of the current selection. Supports
			a nice combination with regular find feature."
			self selectInvisiblyFrom: self startIndex to: self startIndex - 1].
	self findAgainNow.
	self hasSelection
		ifFalse: [^ false].
	self replaceSelectionWith: ChangeText.
	self findAgainNow.
	"Select possible next thing to replace."
	^ true