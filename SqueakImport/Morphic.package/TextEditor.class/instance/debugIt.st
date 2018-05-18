do-its
debugIt

	| receiver context |
	self lineSelectAndEmptyCheck: [^self].

	(model respondsTo: #debugExpression:)
		ifTrue: [^ model perform: #debugExpression: with: self selection].

	receiver := (model respondsTo: #doItReceiver) 
		ifTrue: [model doItReceiver]
		ifFalse: [nil].
		
	context := (model respondsTo: #doItContext) 
		ifTrue: [model doItContext]
		ifFalse: [nil].

	(self compileSelectionFor: receiver in: context) ifNotNil: [:method |
		ToolSet debugMethod: method forReceiver: receiver inContext: context].