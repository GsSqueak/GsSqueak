menu
textSearch: stringWithKeys 
	"search the text on all pages of this book"

	| wants |
	wants := stringWithKeys findTokens: Character separators.
	wants isEmpty ifTrue: [^self].
	self getAllText.	"save in allText, allTextUrls"
	^self findText: wants	"goes to the page and highlights the text"