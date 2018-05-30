message list
list
	"Answer an array of one element made up of the class name and message selector in which the syntax error was found. This is the single item in the message list of a view/browser on the receiver."

	^ Array with: (class name, '  ', (selector ifNil: ['<none>']))
