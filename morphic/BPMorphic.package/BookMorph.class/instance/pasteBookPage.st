menu
pasteBookPage
	"If the paste buffer has something to paste, paste it as a book page."
	| _gsSqueakTemp_aPage |
	_gsSqueakTemp_aPage := self primaryHand objectToPaste.
	_gsSqueakTemp_aPage removeProperty: #revertKey.
	self
		insertPage: _gsSqueakTemp_aPage
		pageSize: _gsSqueakTemp_aPage extent
		atIndex: (pages indexOf: currentPage)
				- 1