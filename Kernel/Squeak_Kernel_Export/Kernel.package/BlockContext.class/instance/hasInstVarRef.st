accessing
hasInstVarRef
	"Answer whether the receiver references an instance variable."

	| method scanner end printer |

	home ifNil: [^false].
	method := self method.
	end := self endPC.
	scanner := InstructionStream new method: method pc: startpc.
	printer := InstVarRefLocator new.

	[scanner pc <= end] whileTrue: [
		(printer interpretNextInstructionUsing: scanner) ifTrue: [^true].
	].
	^false