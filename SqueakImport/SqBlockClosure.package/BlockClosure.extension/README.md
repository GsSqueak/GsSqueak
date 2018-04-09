Instances of BlockClosure represent blocks, a sequence of statements inside square brackets that can be evaluated at any time via one of the value messages (value, value:, value:value:, ... valueWithArguments:), which answer their last statement.  Blocks therefore allow deferred evaluation and so are used to buikld control structures where a sequence of statements are evaluated or not depending on other values in the program.

Blocks can close over variables in their enclosing method or block.  The method in which a block is nested is called its home method.  Blocks can return from their home method via an up-arrow return, and returns to the sender of the message that created the home method, just like a return from the method itself.  BlockClosures are fully first-class objects; they can outlive their enclosing method activation and be answered as results and/or assigned to variables.

BlockClosures are central to the implementation of control structures in Smalltalk.  The arguments to the conditional message ifTrue:ifFalse: are zero-argument blocks, which the receiver is a boolean which responds by evaluating ether the first argument or the second.  The bytecode compiler inlines blocks for certain selectors, compiling to conditional branch and branch bytecodes.  This is done for efficiency.  The full list of inlined messages can be found in MessageNode's MacroSelectors class variable (at time of writing ther=se are ifTrue:, ifFalse:, ifTrue:ifFalse:, ifFalse:ifTrue:, and:, or:, whileFalse:, whileTrue:, whileFalse, whileTrue, to:do:, to:by:do:, caseOf:, caseOf:otherwise:, ifNil:, ifNotNil:, ifNil:ifNotNil:, ifNotNil:ifNil: and repeat.

Examples (more can be found in BlockClosureTest's class comment):
	[1@2] value

	| counter |
	counter := 0.
	{ counter. (1 to: 10) collect: [:n| counter := counter + 1. n + counter]. counter }

	| fibonacciBlock |
	fibonacciBlock := [:n|
					n > 1 ifTrue: [(fibonacciBlock value: n - 1) + (fibonacciBlock value: n - 2)] ifFalse: [1]].
	(1 to: 10) collect: fibonacciBlock

	| randomNumbers |
	randomNumbers := Random new next: 20.
	{ randomNumbers. randomNumbers sorted: [:a :b| a > b] }

Implementation:
BlockClosure implements blocks that are nested within an enclosing method or block context.  Further, the bytecodes for the block are embedded within the home method.  BlockClosure's subclass FullBlockClosure has an independent CompiledBlock as its method, and may or may not have an outerContext.

Instance Variables
	numArgs:		<Integer>
	outerContext:	<Context>
	startpc:			<Integer>

numArgs
	- the number of arguments the block expects

outerContext
	- the Context of the method or block activation in which the receiver is created

startpc
	- the startpc of the block's bytecodes within the home method.