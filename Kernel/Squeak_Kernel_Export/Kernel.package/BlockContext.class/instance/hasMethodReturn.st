accessing
hasMethodReturn
	"Answer whether the receiver has a return ('^') in its code."

	| method scanner end |
	method := self method.
	"Determine end of block from long jump preceding it"
	end := (method at: startpc-2)\\16-4*256 + (method at: startpc-1) + startpc - 1.
	scanner := InstructionStream new method: method pc: startpc.
	scanner scanFor: [:byte | (byte between: 120 and: 124) or: [scanner pc > end]].
	^scanner pc <= end