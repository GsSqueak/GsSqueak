debugging
haltIf: condition
	"This is the typical message to use for inserting breakpoints during 
	debugging.  Param can be a block or expression, halt if true.
	If the Block has one arg, the receiver is bound to that.
 	If the condition is a selector, we look up in the callchain. Halt if
      any method's selector equals selector."
	| cntxt |

	condition isSymbol ifTrue:[
		"only halt if a method with selector symbol is in callchain"
		cntxt := thisContext.
		[cntxt sender isNil] whileFalse: [
			cntxt := cntxt sender. 
			(cntxt selector = condition) ifTrue: [Halt signal].
			].
		^self.
	].
	(condition isBlock 
			ifTrue: [condition valueWithPossibleArgument: self] 
			ifFalse: [condition] 
	) ifTrue: [
		Halt signal
	].