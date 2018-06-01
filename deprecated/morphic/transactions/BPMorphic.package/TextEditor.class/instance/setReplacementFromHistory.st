accessing
setReplacementFromHistory
	"Use history to get the previous replacement."
	self history hasReplacedSomething
		ifTrue: [ChangeText := self history previous contentsAfter]