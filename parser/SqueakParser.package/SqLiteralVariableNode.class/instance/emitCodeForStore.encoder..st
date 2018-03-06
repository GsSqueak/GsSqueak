code generation
emitCodeForStore: stack encoder: encoder 
	| exprOffset |
	writeNode
		ifNil: [^ encoder genStoreLiteralVar: index].
	"On entry the stack has only the expression. Push the binding,
	duplicate the expression, send #value: and pop.
	The various value: methods on Association ReadOnlyVariableBinding
	etc _do not_ return the value assigned; they return the receiver. If
	they did we could generate much simpler code, e.g.
	encoder genPushLiteral: index.
	stack push: 1.
	writeNode emitCode: stack args: 1 encoder: encoder super: false"
	exprOffset := stack position - 1.
	encoder genPushLiteral: index.
	stack push: 1.
	encoder genPushTempLong: exprOffset.
	stack push: 1.
	writeNode
		emitCode: stack
		args: 1
		encoder: encoder
		super: false.
	stack pop: 1.
	encoder genPop