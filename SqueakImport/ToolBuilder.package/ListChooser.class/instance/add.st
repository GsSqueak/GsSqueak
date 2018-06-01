actions
add
	"if the user submits with no valid entry, make them start over"
	self canAdd ifFalse: [^ self changed: #textSelection].
	self result: self searchText asString.
	self changed: #close.