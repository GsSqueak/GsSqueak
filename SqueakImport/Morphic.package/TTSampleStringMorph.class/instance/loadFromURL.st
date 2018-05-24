menus
loadFromURL
	"Allow the user to change the text in a crude way"

	| url |
	url := FillInTheBlankMorph request: ' Type in the url for a TrueType font on the web. '
				 initialAnswer: 'http://www.fontguy.com/download.asp?fontid=1494'.
	url isEmpty ifTrue: [^ self].
	self loadFromURL: url.
