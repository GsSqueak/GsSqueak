do-its
debugIt
	| _gsSqueakTemp_receiver _gsSqueakTemp_context |
	self
		lineSelectAndEmptyCheck: [^ self].
	(model respondsTo: #debugExpression:)
		ifTrue: [^ model perform: #debugExpression: with: self selection].
	_gsSqueakTemp_receiver := (model respondsTo: #doItReceiver)
				ifTrue: [model doItReceiver].
	_gsSqueakTemp_context := (model respondsTo: #doItContext)
				ifTrue: [model doItContext].
	(self compileSelectionFor: _gsSqueakTemp_receiver in: _gsSqueakTemp_context)
		ifNotNil: [:method | ToolSet
				debugMethod: method
				forReceiver: _gsSqueakTemp_receiver
				inContext: _gsSqueakTemp_context]