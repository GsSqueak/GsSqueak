menu
removeStayUpItems
	| _gsSqueakTemp_stayUpItems |
	_gsSqueakTemp_stayUpItems := self items
				select: [:item | item isStayUpItem].
	_gsSqueakTemp_stayUpItems
		do: [:ea | ea delete]