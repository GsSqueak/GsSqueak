-Tools
browseUnusedMethods
	| _gsSqueakTemp_classes _gsSqueakTemp_unsent _gsSqueakTemp_messageList _gsSqueakTemp_cls |
	(_gsSqueakTemp_cls := self selectedClass)
		ifNil: [^ self].
	_gsSqueakTemp_classes := Array with: _gsSqueakTemp_cls with: _gsSqueakTemp_cls class.
	_gsSqueakTemp_unsent := Set new.
	_gsSqueakTemp_classes
		do: [:c | _gsSqueakTemp_unsent addAll: c selectors].
	_gsSqueakTemp_unsent := self systemNavigation allUnSentMessagesIn: _gsSqueakTemp_unsent.
	_gsSqueakTemp_messageList := OrderedCollection new.
	_gsSqueakTemp_classes
		do: [:c | (c selectors
				select: [:s | _gsSqueakTemp_unsent includes: s]) asSortedCollection
				do: [:sel | _gsSqueakTemp_messageList add: c name , ' ' , sel]].
	self systemNavigation browseMessageList: _gsSqueakTemp_messageList name: 'Unsent Methods in ' , _gsSqueakTemp_cls name