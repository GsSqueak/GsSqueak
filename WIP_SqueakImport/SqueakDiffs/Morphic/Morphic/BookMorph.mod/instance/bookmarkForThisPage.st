menu
bookmarkForThisPage
	"If this book exists on a server, make the reference via a URL"
	| bb url um |
	(url := self url) ifNil: [
		bb := SimpleButtonMorph new target: self.
		bb actionSelector: #goToPageMorph:fromBookmark:.
		bb label: 'Bookmark' translated.
		bb arguments: (Array with: currentPage with: bb).
		self primaryHand attachMorph: bb.
		^ bb].
	currentPage url ifNil: [currentPage saveOnURLbasic].
	um := URLMorph newForURL: currentPage url.
	um setURL: currentPage url page: currentPage sqkPage.
	(SqueakPage stemUrl: url) = (SqueakPage stemUrl: currentPage url) 
		ifTrue: [um book: true]
		ifFalse: [um book: url].  	"remember which book"
	um isBookmark: true; label: 'Bookmark' translated.
	um borderWidth: 1; borderColor: #raised.
	um color: (Color r: 0.4 g: 0.8 b: 0.6).
	self primaryHand attachMorph: um.
	^ um