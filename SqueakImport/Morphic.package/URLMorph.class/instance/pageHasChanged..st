updating
pageHasChanged: aSqueakPage
	"The given page has changed. Update this morph if it refers to the given page."

	| thumbnail |
	page == aSqueakPage ifFalse: [^ self].  "this change does not affect me"
	thumbnail := self thumbnailOrNil.
	thumbnail ifNotNil: [
		self extent: (thumbnail extent + 2).
		self changed].
