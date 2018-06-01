user interaction
offerNonPortableFonts
	"Should native fonts be offered when displaying font menus?"
	^ OfferNonPortableFonts
		ifNil: [true]