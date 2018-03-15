toolbuilder
getButtonRow
	"Answer the dynamic button row to use for the currently selected
	item. "
	| _gsSqueakTemp_builder _gsSqueakTemp_svc |
	_gsSqueakTemp_builder := ToolBuilder default.
	_gsSqueakTemp_svc := self universalButtonServices.
	self fileListIndex = 0
		ifFalse: [_gsSqueakTemp_svc := _gsSqueakTemp_svc , self dynamicButtonServices].
	^ _gsSqueakTemp_svc
		collect: [:service | service buildWith: _gsSqueakTemp_builder in: self]