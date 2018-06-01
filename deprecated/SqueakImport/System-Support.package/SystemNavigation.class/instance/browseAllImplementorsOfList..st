browse
browseAllImplementorsOfList: selectorList
	"Create and schedule a message browser on each method that implements 
	the message whose selector is in the argument selectorList. For example, 
	Smalltalk browseAllImplementorsOf: #(at:put: size).
	1/16/96 sw: defer to the titled version"

	self browseAllImplementorsOfList: selectorList title: 'Implementors of all'