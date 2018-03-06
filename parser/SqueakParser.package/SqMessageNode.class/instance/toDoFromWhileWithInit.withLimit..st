decompiling
toDoFromWhileWithInit: incrInit withLimit: limitInitOrNil 
	"If the receiver, a whileTrue: loop, represents a to:[by:]do: loop
	then answer the replacement to:[by:]do:, otherwise answer nil."
	| variable increment limit toDoBlock body test |
	self
		assert: (selector key == #whileTrue:
				and: [incrInit isAssignmentNode]).
	body := arguments last statements.
	(variable := incrInit variable) isTemp
		ifFalse: [^ nil].
	(increment := body last toDoIncrement: variable)
		ifNil: [^ nil].
	receiver statements size ~= 1
		ifTrue: [^ nil].
	test := receiver statements first.
	"Note: test should really be checked that <= or >= comparison
	jibes with the sign of the (constant) increment"
	(test isMessageNode
			and: [(limit := test toDoLimit: variable) notNil])
		ifFalse: [^ nil].
	"The block must not overwrite the limit"
	(limit isVariableNode
			and: [body
					anySatisfy: [:e | e isAssignmentNode
							and: [e variable = limit]]])
		ifTrue: [^ nil].
	toDoBlock := SqBlockNode statements: body allButLast returns: false.
	toDoBlock arguments: {variable}.
	^ SqMessageNode new
		receiver: incrInit value
		selector: (SqSelectorNode new key: #to:by:do: code: #macro)
		arguments: (Array
				with: limit
				with: increment
				with: toDoBlock)
		precedence: precedence