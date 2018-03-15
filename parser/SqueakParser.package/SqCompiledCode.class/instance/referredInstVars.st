accessing
referredInstVars
	| t1 t2 |
	t1 := self methodClass allInstVarNames.
	self isReturnField
		ifTrue: [^ Set
				with: (t1 at: self returnField + 1)].
	t2 := Set new.
	self
		abstractBytecodeMessagesDo: [:t3 | (#(#popIntoReceiverVariable: #pushReceiverVariable: #storeIntoReceiverVariable:) includes: t3 selector)
				ifTrue: [t2
						add: (t1 at: t3 argument + 1)]].
	^ t2