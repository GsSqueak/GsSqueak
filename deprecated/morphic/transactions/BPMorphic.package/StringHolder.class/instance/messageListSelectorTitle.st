-Tools
messageListSelectorTitle
	| _gsSqueakTemp_aString _gsSqueakTemp_aStamp _gsSqueakTemp_aSize |
	self selectedMessageName
		ifNil: [_gsSqueakTemp_aSize := self messageList size.
			^ (_gsSqueakTemp_aSize = 0
				ifTrue: ['no']
				ifFalse: [_gsSqueakTemp_aSize printString])
				, ' message'
				, (_gsSqueakTemp_aSize = 1
						ifTrue: ['']
						ifFalse: ['s'])]
		ifNotNil: [:_gsSqueakTemp_selector | 
			Preferences timeStampsInMenuTitles
				ifFalse: [^ nil].
			_gsSqueakTemp_aString := _gsSqueakTemp_selector truncateWithElipsisTo: 28.
			^ (_gsSqueakTemp_aStamp := self timeStamp) size > 0
				ifTrue: [_gsSqueakTemp_aString , String cr , _gsSqueakTemp_aStamp]
				ifFalse: [_gsSqueakTemp_aString]]