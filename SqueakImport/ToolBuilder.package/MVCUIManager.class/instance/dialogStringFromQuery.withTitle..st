private
dialogStringFromQuery: queryString withTitle: titleString
	"In Morphic, it is common to display a simple dialog that has a title bar. In MVC, simple
	dialogs are simple. If the UIManager requests a dialog with title, add the title as a simply
	decorated line at the top of the dialog text." 
	^String streamContents: [ :strm |
		strm nextPutAll: '- ';
			nextPutAll: titleString;
			nextPutAll: ' -';
			nextPut: Character cr;
			nextPutAll: queryString ]
