converting
normalize
	"Check for leading zeroes and return shortened copy if so"
	| sLen val len oldLen |

	"First establish len = significant length"
	len := oldLen := self digitLength.
	[len = 0 ifTrue: [^0].
	(self digitAt: len) = 0]
		whileTrue: [len := len - 1].

	"Return self, or a shortened copy"
	len < oldLen
		ifTrue: [^ self growto: len]
		ifFalse: [^ self]
