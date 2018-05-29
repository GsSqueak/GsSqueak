instance creation
grabURL: aURLString
	"Create a URLMorph for this url.  Drop it and click it to get the SqueakPage."

	| um |
	(um := self new) isBookmark: true; setURL: aURLString page: nil.
	HandMorph attach: um.
	^ um