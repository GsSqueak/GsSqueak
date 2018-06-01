do-its
tallySelection
	"Treat the current selection as an expression; evaluate it and return the time took for this evaluation"
	| result rcvr ctxt valueAsString v |
	self lineSelectAndEmptyCheck: [^ self].

	(model respondsTo: #doItReceiver) 
		ifTrue: [ rcvr := model doItReceiver.
				ctxt := model doItContext]
		ifFalse: [rcvr := ctxt := nil].
	result := [ | cm |
		cm := rcvr class evaluatorClass new 
			compiledMethodFor: self selectionAsStream
			in: ctxt
			to: rcvr
			notifying: self
			ifFail: [morph flash. ^ self].
		Time millisecondsToRun: 
			[v := cm valueWithReceiver: rcvr arguments: (ctxt ifNil: [#()] ifNotNil: [{ctxt}]) ].
	] 
		on: OutOfScopeNotification 
		do: [ :ex | ex resume: true].

	"We do not want to have large result displayed"
	valueAsString := v printString.
	(valueAsString size > 30) ifTrue: [valueAsString := (valueAsString copyFrom: 1 to: 30), '...'].
	PopUpMenu 
		inform: 'Time to compile and execute: ', result printString, 'ms res: ', valueAsString.
