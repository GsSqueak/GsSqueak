ansi protocol
+ operand
	"operand conforms to protocol Duration"

	| ticks |
 	ticks := self ticks + (operand asDuration ticks) .

	^ self class basicNew
		ticks: ticks
		offset: self offset; 
		yourself
