example pane
contents: aString notifying: aController
	"Take what the user typed and find all selectors containing it"

	| tokens |
	contents := aString.
	classList := #().  classListIndex := 0.
	selectorIndex := 0.
	tokens := contents asString findTokens: ' .'.
	selectorList := Cursor wait showWhile: [
		tokens size = 1 
			ifTrue: [(Symbol selectorsContaining: contents asString) asArray
				sort: [:x :y | x asLowercase <= y asLowercase]]
			ifFalse: [self quickList]].	"find selectors from a single example of data"
	self changed: #messageList.
	self changed: #classList.
	^ true