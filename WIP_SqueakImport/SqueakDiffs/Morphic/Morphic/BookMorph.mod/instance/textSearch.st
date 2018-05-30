menu
textSearch
	"search the text on all pages of this book"

	| wanted wants list str |
	list := self valueOfProperty: #searchKey ifAbsent: [#()].
	str := String streamContents: [:strm | 
			list do: [:each | strm nextPutAll: each; space]].
	wanted := UIManager default request: 'words to search for.  Order is not important.
Beginnings of words are OK.' translated
		initialAnswer: str.
	wants := wanted findTokens: Character separators.
	wants isEmpty ifTrue: [^ self].
	self getAllText.		"save in allText, allTextUrls"
	^ self findText: wants	"goes to the page and highlights the text"