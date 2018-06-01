code generation
sizeCode: encoder args: nArgs super: supered 
	self reserve: encoder.
	^ supered
		ifTrue: [code < Send
				ifTrue: ["i.e. its a special selector"
					code := self code: (index := encoder sharableLitIndex: key) type: 5].
			encoder sizeSendSuper: index numArgs: nArgs]
		ifFalse: [self flag: #yuck.
			"special selector sends cause this problem"
			encoder
				sizeSend: (code < Send
						ifTrue: [code negated]
						ifFalse: [index])
				numArgs: nArgs]