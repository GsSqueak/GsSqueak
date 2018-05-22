menu
textSearch: stringWithKeys 
	"search the text on all pages of this book"
	| _gsSqueakTemp_wants |
	_gsSqueakTemp_wants := stringWithKeys findTokens: Character separators.
	_gsSqueakTemp_wants isEmpty
		ifTrue: [^ self].
	self getAllText.
	"save in allText, allTextUrls"
	^ self findText: _gsSqueakTemp_wants"goes to the page and highlights the text"