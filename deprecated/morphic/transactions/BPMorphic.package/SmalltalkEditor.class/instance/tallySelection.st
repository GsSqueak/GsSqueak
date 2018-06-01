do-its
tallySelection
	"Treat the current selection as an expression; evaluate it and return
	the time took for this evaluation"
	| _gsSqueakTemp_result _gsSqueakTemp_rcvr _gsSqueakTemp_ctxt _gsSqueakTemp_valueAsString _gsSqueakTemp_v |
	self
		lineSelectAndEmptyCheck: [^ self].
	(model respondsTo: #doItReceiver)
		ifTrue: [_gsSqueakTemp_rcvr := model doItReceiver.
			_gsSqueakTemp_ctxt := model doItContext]
		ifFalse: [_gsSqueakTemp_rcvr := _gsSqueakTemp_ctxt := nil].
	_gsSqueakTemp_result := [| cm |
			cm := _gsSqueakTemp_rcvr class evaluatorClass new
						compiledMethodFor: self selectionAsStream
						in: _gsSqueakTemp_ctxt
						to: _gsSqueakTemp_rcvr
						notifying: self
						ifFail: [morph flash.
							^ self].
			Time
				millisecondsToRun: [_gsSqueakTemp_v := cm
								valueWithReceiver: _gsSqueakTemp_rcvr
								arguments: (_gsSqueakTemp_ctxt
										ifNil: [#()]
										ifNotNil: [{_gsSqueakTemp_ctxt}])]]
				on: OutOfScopeNotification
				do: [:ex | ex resume: true].
	"We do not want to have large result displayed"
	_gsSqueakTemp_valueAsString := _gsSqueakTemp_v printString.
	_gsSqueakTemp_valueAsString size > 30
		ifTrue: [_gsSqueakTemp_valueAsString := (_gsSqueakTemp_valueAsString copyFrom: 1 to: 30)
						, '...'].
	PopUpMenu inform: 'Time to compile and execute: ' , _gsSqueakTemp_result printString , 'ms res: ' , _gsSqueakTemp_valueAsString