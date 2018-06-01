examples
examplePostArgs
	"HTTPClient examplePostArgs"

	| args result |
	args := Dictionary new
		at: 'arg1' put: #('val1');
		at: 'arg2' put: #('val2');
		yourself.
	result := HTTPClient httpPostDocument: 'http://www.squeaklet.com/cgi-bin/thrd.pl [^]' args: args.
	Transcript show: result content; cr; cr.

