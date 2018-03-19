stepping and presenter
step
	| _gsSqueakTemp_action |
	_gsSqueakTemp_action := self scrollBarAction.
	_gsSqueakTemp_action
		ifNotNil: [self perform: _gsSqueakTemp_action]