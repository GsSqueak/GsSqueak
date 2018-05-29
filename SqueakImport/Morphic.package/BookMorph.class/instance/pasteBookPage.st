menu
pasteBookPage
	"If the paste buffer has something to paste, paste it as a book page."

	| aPage |
	aPage := self primaryHand objectToPaste.
	aPage removeProperty: #revertKey.

	self insertPage: aPage pageSize: aPage extent atIndex: ((pages indexOf: currentPage) - 1).
	"self goToPageMorph: aPage"