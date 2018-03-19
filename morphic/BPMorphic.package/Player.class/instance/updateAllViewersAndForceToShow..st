misc
updateAllViewersAndForceToShow: aCategory 
	"The receiver's structure has changed, so viewers on it and all its
	siblings need to be reconstituted."
	| _gsSqueakTemp_aPresenter |
	(_gsSqueakTemp_aPresenter := self costume presenter)
		ifNil: [^ self].
	self allOpenViewersOnReceiverAndSiblings
		do: [:aViewer | _gsSqueakTemp_aPresenter updateViewer: aViewer forceToShow: aCategory]