accessing
contentsSelection
	"Return the interval of text in the code pane to select when I set the pane's contents"

	self hasMessageCategorySelected & (self hasMessageSelected not)
		ifTrue: [^ 1 to: 500]	"entire empty method template"
		ifFalse: [^ 1 to: 0]  "null selection"