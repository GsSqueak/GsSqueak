menu
bookmarkForThisPage
	"If this book exists on a server, make the reference via a URL"
	| _gsSqueakTemp_bb _gsSqueakTemp_url _gsSqueakTemp_um |
	(_gsSqueakTemp_url := self url)
		ifNil: [_gsSqueakTemp_bb := SimpleButtonMorph new target: self.
			_gsSqueakTemp_bb actionSelector: #goToPageMorph:fromBookmark:.
			_gsSqueakTemp_bb label: 'Bookmark' translated.
			_gsSqueakTemp_bb
				arguments: (Array with: currentPage with: _gsSqueakTemp_bb).
			self primaryHand attachMorph: _gsSqueakTemp_bb.
			^ _gsSqueakTemp_bb].
	currentPage url
		ifNil: [currentPage saveOnURLbasic].
	_gsSqueakTemp_um := URLMorph newForURL: currentPage url.
	_gsSqueakTemp_um setURL: currentPage url page: currentPage sqkPage.
	(SqueakPage stemUrl: _gsSqueakTemp_url)
			= (SqueakPage stemUrl: currentPage url)
		ifTrue: [_gsSqueakTemp_um book: true]
		ifFalse: [_gsSqueakTemp_um book: _gsSqueakTemp_url].
	"remember which book"
	_gsSqueakTemp_um isBookmark: true;
		 label: 'Bookmark' translated.
	_gsSqueakTemp_um borderWidth: 1;
		 borderColor: #raised.
	_gsSqueakTemp_um
		color: (Color
				r: 0.4
				g: 0.8
				b: 0.6).
	self primaryHand attachMorph: _gsSqueakTemp_um.
	^ _gsSqueakTemp_um