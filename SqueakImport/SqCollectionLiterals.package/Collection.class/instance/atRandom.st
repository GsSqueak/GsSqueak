accessing
atRandom
	"Answer a random element of the receiver.  Uses the process-local random number generator. Causes an error if self has no elements."

	^self atRandom: ThreadSafeRandom value

"Examples:
	#('one' 'or' 'the' 'other') atRandom
	(1 to: 10) atRandom
	'Just pick one of these letters at random' atRandom
	#(3 7 4 9 21) asSet atRandom		(just to show it also works for Sets)
"
