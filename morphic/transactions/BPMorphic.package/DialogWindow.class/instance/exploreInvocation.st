running
exploreInvocation
	| _gsSqueakTemp_result _gsSqueakTemp_context |
	self exclusive: false.
	"We want to explore."
	_gsSqueakTemp_result := OrderedCollection new.
	_gsSqueakTemp_context := thisContext.
	[_gsSqueakTemp_context method selector = #getUserResponse]
		whileFalse: [_gsSqueakTemp_context := _gsSqueakTemp_context sender].
	[_gsSqueakTemp_context sender]
		whileNotNil: [_gsSqueakTemp_result add: _gsSqueakTemp_context method.
			_gsSqueakTemp_context := _gsSqueakTemp_context sender].
	_gsSqueakTemp_result add: _gsSqueakTemp_context method.
	_gsSqueakTemp_result explore