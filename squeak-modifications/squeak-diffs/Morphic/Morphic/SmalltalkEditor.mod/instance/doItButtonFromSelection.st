do-its
doItButtonFromSelection

	| button string cm |
	self lineSelectAndEmptyCheck: [^ nil].
	button := SimpleButtonMorph new.
	string := self selection.
	(model respondsTo: #doItReceiver) 
		ifTrue: [
			button setProperty: #rcvr toValue: model doItReceiver.
			button setProperty: #ctxt toValue: model doItContext].

	cm := (button valueOfProperty: #rcvr) class compilerClass new 
			compiledMethodFor: string readStream
			in: (button valueOfProperty: #ctxt)
			to: (button valueOfProperty: #rcvr)
			notifying: nil
			ifFail: [^ nil].
	button setProperty: #cm toValue: cm.
	button target: [:b |
		[(b valueOfProperty: #cm) valueWithReceiver: (b valueOfProperty: #rcvr) arguments: 
			((b valueOfProperty: #ctxt) ifNotNil: [{(b valueOfProperty: #ctxt) }] ifNil: [#()])]
		on: OutOfScopeNotification 
		do: [ :ex | ex resume: true]];
		actionSelector: #value:;
		arguments: {button}.
	button label: string.
	^ button.
