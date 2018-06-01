-Tools
browseAllMessages
	"Create and schedule a message set browser on all implementors of all
	the messages sent by the current method."
	| _gsSqueakTemp_aClass _gsSqueakTemp_method _gsSqueakTemp_filteredList |
	self selectedMessageName
		ifNotNil: [:_gsSqueakTemp_aName | 
			_gsSqueakTemp_method := (_gsSqueakTemp_aClass := self selectedClassOrMetaClass) compiledMethodAt: _gsSqueakTemp_aName.
			_gsSqueakTemp_filteredList := _gsSqueakTemp_method messages
						reject: [:each | #(#new #initialize #= ) includes: each].
			self systemNavigation browseAllImplementorsOfList: _gsSqueakTemp_filteredList asSortedCollection title: 'All messages sent in ' , _gsSqueakTemp_aClass name , '.' , _gsSqueakTemp_aName]