code generation
sizeCodeForValue: encoder 
	"Hack; we have no way of knowing how much stack space is available."
	elements size <= self maxElementsForConsArray
		ifTrue: [^ (elements
				inject: 0
				into: [:sum :node | sum
						+ (node sizeCodeForValue: encoder)])
				+ (encoder sizePushConsArray: elements size)].
	"Long form: (Array braceStream: N) nextPut: a; nextPut: b; ...;
	braceArray"
	emitNode := SqCascadeNode new
				receiver: (SqMessageNode new
						receiver: (encoder encodeVariable: #Array)
						selector: #braceStream:
						arguments: {encoder encodeLiteral: elements size}
						precedence: 3
						from: encoder)
				messages: ((elements
						collect: [:elt | SqMessageNode new
								receiver: nil
								selector: #nextPut:
								arguments: {elt}
								precedence: 3
								from: encoder])
						copyWith: (SqMessageNode new
								receiver: nil
								selector: #braceArray
								arguments: #()
								precedence: 1
								from: encoder)).
	^ emitNode sizeCodeForValue: encoder