misc
updateAllViewers
	"The receiver's structure has changed, so viewers on it and its siblings
	need to be reconstituted."
	| _gsSqueakTemp_aPresenter |
	(_gsSqueakTemp_aPresenter := self costume presenter)
		ifNil: [^ self].
	self allOpenViewersOnReceiverAndSiblings
		do: [:aViewer | _gsSqueakTemp_aPresenter updateViewer: aViewer]