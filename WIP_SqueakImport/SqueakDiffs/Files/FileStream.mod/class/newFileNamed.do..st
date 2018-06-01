instance creation
newFileNamed: fileName do: aBlock
	"Avi Bryant says, ''This idiom is quite common in other languages that make heavy use of closures (i.e. Lisp (with-file 'foo' (f) ...) and Ruby (File.open('foo'){|f|...})).  It's time Squeak had it, too.''
	
	Returns the result of aBlock."
	
	^self detectFile: (self newFileNamed: fileName) do: aBlock