menu messages
again
	"Do the same find/replace command again. Looks up the editor's own command history and uses the previous command to determine find string and replace string."
	
	self history hasReplacedSomething
		ifFalse: [morph flash. ^ false].
	
	self
		setSearchFromSelectionOrHistory;
		setReplacementFromHistory.
	
	"If we have no selection, give the user one to avoid annoying surprises."
	^ self hasSelection
		ifTrue: [self findReplaceAgainNow]
		ifFalse: [self findAgainNow. false "see #againUpToEnd"]