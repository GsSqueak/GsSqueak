user interaction
offerNonPortableFonts
	"Should native fonts be offered when displaying font menus?"
	<preference: 'Offer Native Fonts'
		category: 'Morphic'
		description: 'When true, an additional menu is offered for choosing non-portable fonts'
		type: #Boolean>
	^OfferNonPortableFonts ifNil:[true]