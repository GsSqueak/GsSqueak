browse
browseAllImplementorsOfList: selectorList title: aTitle 
	"Create and schedule a message browser on each method that implements the message whose selector is in the argument selectorList."
	"For example, self new browseAllImplementorsOf: #(at:put: size). "
	
	| implementorLists |
	implementorLists := selectorList gather: [:each | 
		self allImplementorsOf: each ].
	implementorLists sort.
	^self browseMessageList: implementorLists name: aTitle