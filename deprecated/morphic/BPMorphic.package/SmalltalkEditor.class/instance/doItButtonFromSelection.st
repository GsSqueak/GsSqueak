do-its
doItButtonFromSelection
	| _gsSqueakTemp_button _gsSqueakTemp_string _gsSqueakTemp_cm |
	self
		lineSelectAndEmptyCheck: [^ nil].
	_gsSqueakTemp_button := SimpleButtonMorph new.
	_gsSqueakTemp_string := self selection.
	(model respondsTo: #doItReceiver)
		ifTrue: [_gsSqueakTemp_button setProperty: #rcvr toValue: model doItReceiver.
			_gsSqueakTemp_button setProperty: #ctxt toValue: model doItContext].
	_gsSqueakTemp_cm := (_gsSqueakTemp_button valueOfProperty: #rcvr) class compilerClass new
				compiledMethodFor: _gsSqueakTemp_string readStream
				in: (_gsSqueakTemp_button valueOfProperty: #ctxt)
				to: (_gsSqueakTemp_button valueOfProperty: #rcvr)
				notifying: nil
				ifFail: [^ nil].
	_gsSqueakTemp_button setProperty: #cm toValue: _gsSqueakTemp_cm.
	_gsSqueakTemp_button
		target: [:b | [(b valueOfProperty: #cm)
				valueWithReceiver: (b valueOfProperty: #rcvr)
				arguments: ((b valueOfProperty: #ctxt)
						ifNil: [#()]
						ifNotNil: [{b valueOfProperty: #ctxt}])]
				on: OutOfScopeNotification
				do: [:ex | ex resume: true]];
		 actionSelector: #value:;
		 arguments: {_gsSqueakTemp_button}.
	_gsSqueakTemp_button label: _gsSqueakTemp_string.
	^ _gsSqueakTemp_button