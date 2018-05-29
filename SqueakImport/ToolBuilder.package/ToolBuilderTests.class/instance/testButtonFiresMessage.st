tests-button
testButtonFiresMessage
	| spec |
	spec := builder pluggableButtonSpec new.
	spec model: self.
	spec action: (MessageSend receiver: self selector: #fireButton arguments: #()).
	widget := builder build: spec.
	queries := IdentitySet new.
	self fireButtonWidget.
	self assert: (queries includes: #fireButton).