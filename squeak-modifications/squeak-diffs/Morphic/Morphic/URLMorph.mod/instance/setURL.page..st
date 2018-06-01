private
setURL: aURLString page: aSqueakPage
	"Initialize the receiver for the given URL and page."

	url := aURLString.
	page := aSqueakPage.
	page ifNotNil: [self pageHasChanged: page].
