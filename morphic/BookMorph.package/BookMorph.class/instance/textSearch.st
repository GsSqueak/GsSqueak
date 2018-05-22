menu
textSearch
	"search the text on all pages of this book"
	| _gsSqueakTemp_wanted _gsSqueakTemp_wants _gsSqueakTemp_list _gsSqueakTemp_str |
	_gsSqueakTemp_list := self
				valueOfProperty: #searchKey
				ifAbsent: [#()].
	_gsSqueakTemp_str := String
				streamContents: [:strm | _gsSqueakTemp_list
						do: [:each | strm nextPutAll: each;
								 space]].
	_gsSqueakTemp_wanted := UIManager default request: 'words to search for.  Order is not important.
Beginnings of words are OK.' translated initialAnswer: _gsSqueakTemp_str.
	_gsSqueakTemp_wants := _gsSqueakTemp_wanted findTokens: Character separators.
	_gsSqueakTemp_wants isEmpty
		ifTrue: [^ self].
	self getAllText.
	"save in allText, allTextUrls"
	^ self findText: _gsSqueakTemp_wants"goes to the page and highlights the text"