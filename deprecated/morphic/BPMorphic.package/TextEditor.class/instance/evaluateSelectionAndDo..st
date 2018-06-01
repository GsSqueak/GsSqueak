do-its
evaluateSelectionAndDo: aBlock 
	"Treat the current selection as an expression; evaluate it and invoke
	aBlock with the result."
	| _gsSqueakTemp_result _gsSqueakTemp_rcvr _gsSqueakTemp_ctxt |
	self
		lineSelectAndEmptyCheck: [^ nil].
	(model respondsTo: #evaluateExpression:)
		ifTrue: [^ aBlock
				value: (model perform: #evaluateExpression: with: self selection)].
	(model respondsTo: #doItReceiver)
		ifTrue: [_gsSqueakTemp_rcvr := model doItReceiver.
			_gsSqueakTemp_ctxt := model doItContext]
		ifFalse: [_gsSqueakTemp_rcvr := _gsSqueakTemp_ctxt := nil].
	_gsSqueakTemp_result := [_gsSqueakTemp_rcvr class evaluatorClass new
				evaluate: self selectionAsStream
				in: _gsSqueakTemp_ctxt
				to: _gsSqueakTemp_rcvr
				environment: (model environment
						ifNil: [Smalltalk globals])
				notifying: self
				ifFail: [morph flash.
					^ nil]
				logged: true]
				on: OutOfScopeNotification
				do: [:ex | ex resume: true].
	(model respondsTo: #expressionEvaluated:result:)
		ifTrue: [model
				perform: #expressionEvaluated:result:
				with: self selection
				with: _gsSqueakTemp_result].
	^ aBlock value: _gsSqueakTemp_result